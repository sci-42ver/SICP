#lang racket/base
(require compatibility/mlist)
;; https://docs.racket-lang.org/compatibility/mlists.html

(define (true? x) (not (eq? x #f)))
(define (false? x) (eq? x #f))

(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    (cons (eval (first-operand exps) env)
          (list-of-values (rest-operands exps) env))))

(define (eval-if exp env)
  (if (true? (actual-value (if-predicate exp) env))
    (eval (if-consequent exp) env)
    (eval (if-alternative exp) env)))

(define (eval-sequence exps env)
  (cond [(last-exp? exps)
         (eval (first-exp exps) env)]
    [else
     (eval (first-exp exps) env)
     (eval-sequence (rest-exps exps) env)]))

(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
                       (eval (assignment-value exp) env)
                       env)
  'ok)

(define (eval-definition exp env)
  (define-variable! (definition-variable exp)
                    (eval (definition-value exp) env)
                    env)
  'ok)

(define (self-evaluating? exp)
  (cond [(number? exp) #t]
    [(string? exp) #t]
    [else #f]))

(define (variable? exp) (symbol? exp))
(define (quoted? exp) (tagged-list? exp 'quote))
(define (text-of-quotation exp) (cadr exp))

(define (tagged-list? exp tag)
  (cond [(pair? exp) (eq? (car exp) tag)]
    [(mpair? exp) (eq? (mcar exp) tag)]
    [else #f]))

(define (assignment? exp) (tagged-list? exp 'set!))
(define (assignment-variable exp) (cadr exp))
(define (assignment-value exp) (caddr exp))

(define (definition? exp)
  (tagged-list? exp 'define))
(define (definition-variable exp)
  (if (symbol? (cadr exp))
    (cadr exp)
    (caadr exp)))
(define (definition-value exp)
  (if (symbol? (cadr exp))
    (caddr exp)
    (make-lambda (cdadr exp)   ;; formal parameters
                 (cddr exp)))) ;; body

(define (lambda? exp) (tagged-list? exp 'lambda))
(define (lambda-parameters exp) (cadr exp))
(define (lambda-body exp) (cddr exp))
(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))

(define (if? exp) (tagged-list? exp 'if))
(define (if-predicate exp) (cadr exp))
(define (if-consequent exp) (caddr exp))
(define (if-alternative exp)
  (if (not (null? (cdddr exp)))
    (cadddr exp)
    'false))
(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

(define (begin? exp) (tagged-list? exp 'begin))
(define (begin-actions exp) (cdr exp))

(define (last-exp? seq) (null? (cdr seq)))
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))

(define (sequence->exp seq)
  (cond [(null? seq) seq]
    [(last-exp? seq) (first-exp seq)]
    [else (make-begin seq)]))
(define (make-begin seq) (cons 'begin seq))

(define (application? exp) (pair? exp))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))

(define (cond? exp) (tagged-list? exp 'cond))
(define (cond-clauses exp) (cdr exp))
(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))
(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))
(define (cond->if exp) (expand-clauses (cond-clauses exp)))
(define (expand-clauses clauses)
  (if (null? clauses)
    'false ;; no else clause
    (let ([first (car clauses)]
          [rest (cdr clauses)])
      (if (cond-else-clause? first)
        (if (null? rest)
          (sequence->exp (cond-actions first))
          (error "ELSE clause isn't last: COND->IF"
                 clauses))
        (make-if (cond-predicate first)
                 (sequence->exp (cond-actions first))
                 (expand-clauses rest))))))

(define (primitive-procedure? proc)
  (tagged-list? proc 'primitive))
(define (primitive-implementation proc) (cadr proc))

(define primitive-procedures
  (list (list 'car car)
        (list 'cdr cdr)
        (list 'cons cons)
        (list 'null? null?)
        (list 'list list)
        (list '+ +)
        (list '- -)
        (list '* *)
        (list '/ /)
        (list '= =)))
(define (primitive-procedure-names)
  (map car primitive-procedures))
(define (primitive-procedure-objects)
  (map (lambda (proc) (list 'primitive (cadr proc)))
       primitive-procedures))
(define apply-in-underlying-scheme apply)
(define (apply-primitive-procedure proc args)
  (apply-in-underlying-scheme
   (primitive-implementation proc) args))

(define (eval exp env)
  (cond [(self-evaluating? exp) exp]
    [(variable? exp) (lookup-variable-value exp env)]
    [(quoted? exp) (text-of-quotation exp)]
    [(assignment? exp)
     (eval-assignment exp env)]
    [(definition? exp)
     (eval-definition exp env)]
    [(if? exp) (eval-if exp env)]
    [(lambda? exp) (make-procedure (lambda-parameters exp)
                                   (lambda-body exp)
                                   env)]
    [(begin? exp)
     (eval-sequence (begin-actions exp) env)]
    [(cond? exp) (eval (cond->if exp) env)]
    [(application? exp)
     (myapply (actual-value (operator exp) env)
              (operands exp)
              env)]
    [else
     (error "Unknown expression type: EVAL" exp)]))

(define (myapply procedure arguments env)
  (cond [(primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env))]
    [(compound-procedure? procedure)
     (eval-sequence
      (procedure-body procedure)
      (extend-environment
       (procedure-parameters procedure)
       (list-of-delayed-args (cadr procedure) arguments env)
       (procedure-environment procedure)))]
    [else
     (error
      "Unknown procedure type: APPLY" procedure)]))

(define (make-procedure parameters body env)
  (list 'procedure parameters body env))
(define (compound-procedure? p)
  (tagged-list? p 'procedure))
(define (procedure-parameters p)
  (map (lambda (x)
         (if (pair? x)
           (car x)
           x))
       (cadr p)))
(define (procedure-body p) (caddr p))
(define (procedure-environment p) (cadddr p))

(define (enclosing-environment env) (cdr env))
(define (first-frame env) (car env))
(define the-empty-environment '())

(define (mmap proc . args)
  (if (null? (car args))
    null
    (mcons
     (apply proc (map car args))
     (apply mmap
            (cons proc (map cdr args))))))

(define (make-frame variables values)
  (mmap mcons variables values))
(define (add-binding-to-frame! var val frame)
  (mappend! frame (mlist (mcons var val))))
(define (frame-unit-variable unit) (mcar unit))
(define (frame-unit-value unit) (mcdr unit))

(define (travsersing-env end-frame-proc find-proc end-env-proc env var)
  (define (env-loop env)
    (define (scan pairs)
      (let ([current-pair
             (if (mpair? pairs)
               (mcar pairs)
               null)])
        (cond [(null? current-pair)
               (end-frame-proc env)]
          [(eq? var (frame-unit-variable current-pair))
           (find-proc current-pair)]
          [else (scan (mcdr pairs))])))
    (if (eq? env the-empty-environment)
      (end-env-proc var)
      (scan (first-frame env))))
  (env-loop env))

(define (set-variable-value! var val env)
  (travsersing-env
   (lambda (env) (set-variable-value! var val (enclosing-environment env)))
   (lambda (current-pair) (set-mcdr! current-pair val))
   (lambda (var) (error "Unbound variable: SET!" var))
   env
   var))

(define (define-variable! var val env)
  (travsersing-env
   (lambda (env) (add-binding-to-frame! var val (first-frame env)))
   (lambda (current-pair) (set-mcdr! current-pair val))
   (lambda (var) (error "Empty environment" var))
   env
   var))

(define (lookup-variable-value var env)
  (travsersing-env
   (lambda (env) (lookup-variable-value var (enclosing-environment env)))
   (lambda (current-pair) (frame-unit-value current-pair))
   (lambda (var) (error "Unbound variable" var))
   env
   var))

(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
    (cons (make-frame vars vals) base-env)
    (if (< (length vars) (length vals))
      (error "Too many arguments supplied" vars vals)
      (error "Too few arguments supplied" vars vals))))

(define (setup-environment)
  (let ([initial-env
         (extend-environment (primitive-procedure-names)
                             (primitive-procedure-objects)
                             the-empty-environment)])
    (define-variable! 'true #t initial-env)
    (define-variable! 'false #f initial-env)
    initial-env))
(define the-global-environment (setup-environment))

(define (actual-value exp env)
  (force-it (eval exp env)))
(define (force-it obj)
  (cond [(thunk? obj)
         (actual-value (thunk-exp obj)
                       (thunk-env obj))]
    [(thunk-memo? obj)
     (let ([result (actual-value (thunk-exp obj)
                                 (thunk-env obj))])
       (set-mcar! obj 'evaluated-thunk)
       (set-mcar! (mcdr obj)
                  result)  ;; replace exp with its value
       (set-mcdr! (mcdr obj)
                  '())     ;; forget unneeded env
       result)]
    [(evaluated-thunk? obj) (thunk-value obj)]
    [else obj]))
(define (delay-it exp env)
  (mlist 'thunk exp env))
(define (delay-memo-it exp env)
  (mlist 'thunk-memo exp env))
(define (thunk? obj)
  (tagged-list? obj 'thunk))
(define (thunk-memo? obj)
  (tagged-list? obj 'thunk-memo))
(define (thunk-exp thunk) (mcar (mcdr thunk)))
(define (thunk-env thunk) (mcar (mcdr (mcdr thunk))))

(define (evaluated-thunk? obj)
  (tagged-list? obj 'evaluated-thunk))
(define (thunk-value evaluated-thunk)
  (mcar (mcdr evaluated-thunk)))

(define (list-of-arg-values exps env)
  (if (no-operands? exps)
    '()
    (cons (actual-value (first-operand exps)
                        env)
          (list-of-arg-values (rest-operands exps)
                              env))))
(define (list-of-delayed-args parameters exps env)
  (if (no-operands? exps)
    '()
    (let* ([first-op (first-operand exps)]
           [first-pa (car parameters)]
           [type (if (pair? first-pa) (cadr first-pa) null)]
           [rest-op (list-of-delayed-args (cdr parameters)
                                          (rest-operands exps)
                                          env)])
      (cond [(eq? type 'lazy)
             (cons (delay-it first-op env) rest-op)]
        [(eq? type 'lazy-memo)
         (cons (delay-memo-it first-op env) rest-op)]
        [else (cons (eval first-op env) rest-op)]))))

(define input-prompt ";;; M-Eval input:")
(define output-prompt ";;; M-Eval value:")
(define (driver-loop)
  (prompt-for-input input-prompt)
  (let* ([input (read)]
         [output
          (actual-value
           input the-global-environment)])
    (announce-output output-prompt)
    (user-print output))
  (driver-loop))
(define (prompt-for-input string)
  (newline) (newline) (display string) (newline))
(define (announce-output string)
  (newline) (display string) (newline))
(define (user-print object)
  (if (compound-procedure? object)
    (display (list 'compound-procedure
                   (procedure-parameters object)
                   (procedure-body object)
                   '<procedure-env>))
    (display object)))
(driver-loop)

;; changed procedures: list-of-delayed-args force-it procedure-parameters myapply
;; added procedures: delay-memo-it thunk-memo?

;; test lazy
(define (try (a lazy) (b lazy)) (if (= a 0) 1 b))
(try 0 (/ 1 0))
;; 1

;; test memorize
(define count 0)
(define (id (x lazy-memo)) (set! count (+ count 1)) x)
(define w (id (id 10)))
count
;; 1
w
;; 10
count
;; 2
