#lang racket/base

(define (square x) (* x x))

;; same as wiki sq-tree-2
(define (square-tree tree)
  (cond [(null? tree) null]
    [(not (pair? tree)) (square tree)]
    [else (cons (square-tree (car tree))
                (square-tree (cdr tree)))]))

;; same as wiki bishboria
(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree sub-tree)
           (square sub-tree)))
       tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
; '(1 (4 (9 16) 25) (36 49))
