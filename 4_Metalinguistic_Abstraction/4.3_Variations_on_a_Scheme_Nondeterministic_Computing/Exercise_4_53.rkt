#lang racket/base
(require math/number-theory) ;; prime?
;; https://github.com/racket/math/blob/master/math-lib/math/private/number-theory/number-theory.rkt#L193
;;; It may use https://en.wikipedia.org/wiki/Sieve_of_Atkin for small-prime? (skipped review)
;; (< n N) case does as the figure of https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
;; TODO [MCA, p.509 - Algorithm 18.5] not found in http://lib.ysu.am/disciplines_bk/8daf5ccde25503ca099cd564bc4018f2.pdf

;; add prime? to primitive-procedures

(define (require p) (if (not p) (amb)))
(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items))))
(define (prime-sum-pair list1 list2)
  (let ([a (an-element-of list1)]
        [b (an-element-of list2)])
    (require (prime? (+ a b)))
    (list a b)))
(let ([pairs '()])
  (if-fail
   (let ([p (prime-sum-pair '(1 3 5 8)
                            '(20 35 110))])
     (permanent-set! pairs (cons p pairs))
     (amb))
   pairs))

;; ((8 35) (3 110) (3 20))
