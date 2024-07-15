#lang racket/base

(define (for-each f list)
  ;; Same as jz's
  (when (not (null? list))
    (f (car list))
    (for-each f (cdr list))))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))

; 57
; 321
; 88
