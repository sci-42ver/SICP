#lang racket/base

(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (add-interval x y)
  (make-interval  (+ (lower-bound x) (lower-bound y))
                  (+ (upper-bound x) (upper-bound y))))

(define (sub-interval a b)
  (add-interval
   a
   (make-interval
    (- (lower-bound b))
    (- (upper-bound b)))))

(define (mul-interval x y)
  (let ([p1 (* (lower-bound x) (lower-bound y))]
        [p2 (* (lower-bound x) (upper-bound y))]
        [p3 (* (upper-bound x) (lower-bound y))]
        [p4 (* (upper-bound x) (upper-bound y))])
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (when (= (interval-width y) 0)
    (error "can't divide a zero length interval"))
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

(define (interval-width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

(define a (make-interval 3 4))
(define b (make-interval 1 1))
(div-interval a b)
