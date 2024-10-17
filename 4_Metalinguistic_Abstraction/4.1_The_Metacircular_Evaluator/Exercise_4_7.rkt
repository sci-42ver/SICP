#lang racket/base

(let* ([x 3]
       [y (+ x 2)]
       [z (+ x y 5)])
  (* x z))

; transform to nested lets:
(let ([x 3])
  (let ([y (+ x 2)])
    (let ([z (+ x y 5)])
      (* x z))))

(define (make-let bindings body)
  ;; wrong just as LisScheSic's 2nd comment says
  (cons 'let (cons bindings body)))

; derived expression
(define (let*->nested-lets exp)
  (let ([bindings (cadr exp)]
        [body (cddr exp)])
    (define (iter bindings-list)
      (if (null? bindings-list)
        body
        (make-let (car bindings-list) (iter (cdr bindings-list)))))
    (iter bindings)))

(define (eval-let* exp env) (eval (let*->nested-lets exp) env))

((lambda (x)
   ((lambda (y)
      ((lambda (z)
         (* x z))
       (+ x y 5)))
    (+ x 2)))
 3)

; I think explicitly expand let* is same as nested let expressions.

(define test-exp 
  '(let* ((x 3)
       (y (+ x 2))
       (z (+ x y 5)))
  (* x z)))

; https://stackoverflow.com/q/34852667 https://docs.racket-lang.org/pkg/cmdline.html#%28part._raco-pkg-install%29
;; https://docs.racket-lang.org/ts-reference/Typed_Units.html omit /unit
(require typed/racket)
(define (test)
  (assert 
    (equal? '(let ((x 3)) (let ((y (+ x 2))) (let ((z (+ x y 5))) (* x z)))) 
      (let*->nested-lets test-exp)))
  (assert 
    (equal? '(let ((x 1)) (let ((y 2)) (begin x y))) 
      (let*->nested-lets '(let* ((x 1) (y 2)) x y))))
  (assert 
    (equal? '(begin x y) 
      (let*->nested-lets '(let* () x y))))
  )
; (test)
(let*->nested-lets test-exp)