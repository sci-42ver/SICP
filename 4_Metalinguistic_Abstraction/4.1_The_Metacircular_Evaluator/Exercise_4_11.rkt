#lang racket/base

(define (mmap proc . args)
  (if (null? (car args))
    null
    (mcons
     (apply proc (map mcar args))
     (apply mmap
            (cons proc (map mcdr args))))))
(define (mlist . args)
  (define (mlist-iter a l)
    (if (null? a)
      l
      (mlist-iter (cdr a) (mcons (car a) l))))
  (mlist-iter args null))

(define (enclosing-environment env) (cdr env))
(define (first-frame env) (car env))
(define the-empty-environment '())

(define (make-frame variables values)
  (mmap mcons variables values))
(define (frame-variables frame) (mmap mcar frame))
(define (frame-values frame) (mmap mcdr frame))
(define (add-binding-to-frame! var val frame)
  ; (set-mcar! frame (mcons (mcons var val) (mcar frame)))
  (set-mcdr! frame (mcons (mcons var val) (mcdr frame)))
  )
(define (frame-unit-variable unit) (mcar unit))
(define (frame-unit-value unit) (mcdr unit))

;; same as assoc to iter.
(define (set-variable-value! var val env)
  (define (env-loop env)
    (define (scan pairs)
      (let ([current-pair (mcar pairs)])
        (cond [(null? current-pair)
               (env-loop (enclosing-environment env))]
          [(eq? var (frame-unit-variable current-pair)) (set-mcdr! current-pair val)]
          [else (scan (mcdr pairs))])))
    (if (eq? env the-empty-environment)
      (error "Unbound variable: SET!" var)
      (let ([frame (first-frame env)])
        (scan frame))))
  (env-loop env))

(define (define-variable! var val env)
  (let ([frame (first-frame env)])
    (define (scan pairs)
      (if (null? pairs)
        (add-binding-to-frame! var val frame)
        (let ([current-pair (mcar pairs)])
          (cond
            [(eq? var (frame-unit-variable current-pair)) (set-mcdr! current-pair val)]
            [else (scan (mcdr pairs))]))))
    (scan frame)))

;; test
(define frame-a (make-frame (mlist 'a 'b 'c) (mlist 1 2 3)))
frame-a
;; (mcons (mcons 'c 3) (mcons (mcons 'b 2) (mcons (mcons 'a 1) '())))
(frame-variables frame-a)
;; (mcons 'c (mcons 'b (mcons 'a '())))
(frame-values frame-a)
;; (mcons 3 (mcons 2 (mcons 1 '())))
(add-binding-to-frame! 'd 4 frame-a)
frame-a
;; (mcons (mcons 'c 3) (mcons (mcons 'd 4) (mcons (mcons 'b 2) (mcons (mcons 'a 1) '()))))

;; test from 4_11_lib.scm
(define (mcons-length lst)
  (define (iter arg-lst cnt)
    (if (null? arg-lst)
      cnt
      (iter (mcdr arg-lst) (+ 1 cnt))))
  (iter lst 0)
  )
;; from book using mcar/mcdr.
(define (extend-environment vars vals base-env)
  (if (= (mcons-length vars) (mcons-length vals))
      (cons (make-frame vars vals) base-env)
      (if (< (mcons-length vars) (mcons-length vals))
          (error "Too many arguments supplied" vars vals)
          (error "Too few arguments supplied" vars vals))))
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (mcar vars))
             (mcar vals))
            (else (scan (mcdr vars) (mcdr vals)))))
    (if (eq? env the-empty-environment)
        (begin
          (displayln env)
          (error "Unbound variable" var))
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

(require typed/racket)
(define (test)
  ;; modified
  (define variables (mlist 'a 'b 'c))
  (define values (mlist 0 1 2))

  (define frame (make-frame variables values))
  (assert (equal? (frame-variables frame) variables))
  (assert (equal? (frame-values frame) values))
  ;; test with env
  (define base-env (extend-environment variables values the-empty-environment))
  (assert (= 0 (lookup-variable-value 'a base-env)))
  (set-variable-value! 'a 1 base-env)
  (assert (= 1 (lookup-variable-value 'a base-env)))
  (define-variable! 'd 3 base-env)
  (assert (= 3 (lookup-variable-value 'd base-env)))
  (define-variable! 'd 4 base-env)
  (assert (= 4 (lookup-variable-value 'd base-env)))
  )
(test)