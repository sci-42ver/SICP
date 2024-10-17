#lang racket/base

; (let ⟨var⟩ ⟨bindings⟩ ⟨body⟩)
; ; named let is equivalent to:
; (let ⟨bindings⟩
;   (define (⟨var⟩ bindings-var-list) body)
;   (⟨var⟩ bindings-var-list))

(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))

(define (named-let? exp)
  (symbol? (cadr exp)))

(define (let-bindings exp)
  (if (named-let? exp)
    (caddr exp)
    (cadr exp)))

(define (let-body exp)
  (if (named-let? exp)
    (cdddr exp)
    (cddr exp)))

(define (make-let bindings body)
  ;; compared with http://community.schemewiki.org/?sicp-ex-4.7 where we use `list` to make `(make-lets (cdr exprs))` right.
  ;; But here only 1 level, so `cons 'let` is fine. 
  (cons 'let (cons bindings body)))

(define (make-define id expr)
  ;; the difference from wiki meteorgan's is only `(named-let-func-body expr)` where expr is (+ a b) instead of ((+ a b)) here.
  (cons 'define (cons id expr))
  )

(define (let->combination exp)
  (let* ([bindings (let-bindings exp)]
         [var-list (map car bindings)]
         [exp-list (map cadr bindings)]
         [body (let-body exp)])
    (if (named-let? exp)
      ;; same as meteorgan's but evaluating args first.
      (make-let bindings
                (list (make-define (cons (cadr exp) var-list) body)
                      (cons (cadr exp) var-list)))
      (cons (make-lambda var-list body) exp-list))))

(define (eval-let exp env) (eval (let->combination exp) env))

(let->combination '(let test ((a 0) (b 1)) (+ a b)))
; '(let ((a 0) (b 1)) (define (test a b) (+ a b)) (test a b))

(let->combination '(let ((a 0) (b 1)) (+ a b)))
; '((lambda (a b) (+ a b)) 0 1)
