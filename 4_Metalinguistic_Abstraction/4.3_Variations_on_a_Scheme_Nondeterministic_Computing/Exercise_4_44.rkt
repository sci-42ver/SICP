#lang sicp

(define (require p) (if (not p) (amb)))

(define (an-integer-between a b)
  (require (<= a b))
  (amb a (an-integer-between (+ a 1) b)))

(define (queens n)
  ;; similar to woofy
  ;; 0. short circuit can be ensured either by or/and or require.
  ;; 1. Use col/row differences instead of (-/+ col k).
  (define (loop-board new-queen-col new-queen-row nth-row locations)
    (if (not (null? locations))
      (begin
        (require
         (and (not (= new-queen-col (car locations))) ;; not same column
              (not (= (abs (- new-queen-col (car locations))) ;; not same (anti-)diagonal
                      (abs (- new-queen-row nth-row))))))
        (loop-board new-queen-col new-queen-row (+ nth-row 1) (cdr locations)))))
  (define (build-board k locations)
    (let ([new-queen (an-integer-between 1 n)])
      (cond 
        ;; implicit in (<= k n).
        ; [(= k 1) (build-board (+ k 1) (list new-queen))]
        [(<= k n)
         (loop-board new-queen k 1 locations)
         (build-board (+ k 1) (append locations (list new-queen)))]
        [else locations])))
  (build-board 1 '()))

(queens 8)
;; (1 5 8 6 3 7 2 4)
