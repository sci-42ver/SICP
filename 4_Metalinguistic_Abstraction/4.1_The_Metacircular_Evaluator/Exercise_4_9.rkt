#lang racket/base

;;; same as MIT/GNU Scheme
;; (do ([id init-expr step-expr-maybe] ...)
;;     (stop?-expr finish-expr ...)
;;   expr ...)
;; https://docs.racket-lang.org/reference/for.html?q=do#%28form._%28%28lib._racket%2Fprivate%2Fmore-scheme..rkt%29._do%29%29

(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))

(define (make-define id expr)
  (cons 'define (cons id expr)))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

(define (make-begin seq) (cons 'begin seq))

(define (do->combination exp)
  (let ([var-list (map car (cadr exp))]
        [init-list (map cadr (cadr exp))]
        ;; wrong. we need tomanipulate null step-expr-maybe.
        [intermediate-step-list (map cddr (cadr exp))]
        [stop?-expr (caaddr exp)]
        [finish-expr (cdaddr exp)]
        [expr (cdddr exp)])
    (let ([step-list 
            (map 
              (lambda (var step) 
                (if (null? step)
                  var
                  (car step))) 
              var-list intermediate-step-list)])
      ;; same resulting structure as woofy's.
      ;; i.e. (make-procedure-application ... '())
      (list
        (make-lambda null
                      (list
                        ;; i.e. woofy's make-procedure-definition 
                        (make-define
                          (cons 'do-procedure var-list)
                          (list
                            (make-if stop?-expr
                            ;; better to use sequence->exp.
                                      (make-begin finish-expr)
                                      (make-begin
                                      (append expr
                                              (list (cons 'do-procedure
                                                          step-list)))))))
                        (cons 'do-procedure init-list)))))))

(define (eval-do exp env)
  (eval (do->combination exp) env))

(do->combination '(do ((i 0 (add1 i)))
                    ((> i 5) 'done)
                    (println i)))
;; '((lambda () (define (do-procedure i) (if (> i 5) (begin 'done) (begin (println i) (do-procedure (add1 i))))) (do-procedure 0)))
(do->combination 
  ;; from 4_9_official.scm
  '(do ((loop (make-vector 5))
        (i 0 (+ i 1)))
      ((begin 
        (set! test loop)
        (= i 5)) (list loop test))
    (vector-set! loop i i)))

((lambda ()
   (define (do-procedure i)
     (if (> i 5)
       (begin 'done)
       (begin (println i)
         (do-procedure (add1 i)))))
   (do-procedure 0)))
;; 0
;; 1
;; 2
;; 3
;; 4
;; 5
;; 'done

