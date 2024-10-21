#lang racket/base

;; move tag to the end only need to modify tagged-list?
;;; see `(define (cond-clauses exp) (cdr exp))`... All related func's with exp need changes.

;; same as wiki
(define (last-exp? seq) (null? (cdr seq)))

(define (last-ele seq)
  (if (last-exp? seq)
    (car seq)
    (last-ele (cdr seq))))

(define (tagged-list? exp tag)
  (if (pair? exp)
    (eq? (last-ele exp) tag)
    #f))
