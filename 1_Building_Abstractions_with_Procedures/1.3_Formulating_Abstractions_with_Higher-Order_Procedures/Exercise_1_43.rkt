#lang racket/base
(require racket/function) ; identity

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))

; (define (repeated f n)
;   (if (< n 1)
;     identity
;     (compose f (repeated f (sub1 n)))))

(require racket/trace)
(define (repeated f n)
  (define (iter g i)
    (if (< i 1)
      g
      (iter (compose f g) (sub1 i))))
  (trace iter)
  ;;; From wiki
  ;;; > Note: This is not linearly iterative as described in the book as a chain of deferred operations is still being built.
  ;;; This seems to be wrong
  (iter identity n))

((repeated square 2) 5)
; 5 ^ (2 ^ 2) = 625
