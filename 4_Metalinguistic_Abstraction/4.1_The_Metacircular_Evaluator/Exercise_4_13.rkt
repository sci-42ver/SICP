#lang racket/base

(define (mmap proc . args)
  (if (null? (car args))
      null
      (mcons
       (apply proc (map mcar args))
       (apply mmap
              (cons proc (map mcdr args))))))

(define (enclosing-environment env) (cdr env))
(define (first-frame env) (car env))
(define the-empty-environment '())

(define (make-frame variables values)
  (mmap mcons variables values))
(define (frame-variables frame) (mmap mcar frame))
(define (frame-values frame) (mmap mcdr frame))
(define (add-binding-to-frame! var val frame)
  (set-mcar! frame (mcons (mcons var val) (mcar frame))))
(define (frame-unit-variable unit) (mcar unit))
(define (frame-unit-value unit) (mcdr unit))

(define (travsersing-env end-frame-proc find-proc end-env-proc env var)
  (define (env-loop env)
    (define (scan pairs)
      (let ([current-pair (mcar pairs)])
        (cond [(null? current-pair)
               (end-frame-proc env)]
              [(eq? var (frame-unit-variable current-pair))
               (find-proc current-pair)]
              [else (scan (mcdr pairs))])))
    (if (eq? env the-empty-environment)
        (end-env-proc var)
        (let ([frame (first-frame env)])
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

(define (make-unbound! var env)
  (travsersing-env
   (lambda (env) null)
   (lambda (current-pair)
     (set-mcar! current-pair null)
     (set-mcdr! current-pair null))
   (lambda (var) null)
   env
   var))