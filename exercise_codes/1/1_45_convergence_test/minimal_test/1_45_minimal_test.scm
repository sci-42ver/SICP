;;; from the above wiki
(define (average-damp f) 
    (lambda (x) (/ (+ x (f x)) 2)))
(define (repeated f n) 
    (define (compose f g) 
      (lambda (x) (f (g x)))) 
    (if (= n 1) 
      f 
      (compose f (repeated f (- n 1)))))

;;; from book
(define tolerance 0.00001)

;;; small modified fixed_point
(define (displayln x)
  (newline)
  (display x))
(define (fixed_point_bound f first-guess bound whether_output_cnt)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (let ((next (f guess)))
      (displayln guess)
      (if (or (close-enough? guess next) (= count bound))
          (begin 
            (displayln "finished count:")
            (displayln count)
            (if whether_output_cnt
              count
              next))
          (try next (+ count 1)))))
  (displayln "fixed_point_bound:")
  (try first-guess 1))

(define small_bound 100)
(define (init_map x y n) 
  (/ x ((repeated (lambda (m) (* y m)) (- n 1)) 1))) 
(define (root n x average_damp_level bound init whether_output_cnt) 
  (define transformed_f ((repeated average-damp average_damp_level) (lambda (y) (init_map x y n)))) 
  (displayln "average_damp_level:")
  (displayln average_damp_level)
  (fixed_point_bound transformed_f init bound whether_output_cnt)) 
(define n2 50) 
(- (root n2 (expt 3 n2) 1 (* small_bound 2) 1.0 #f) 3) 
(- (root n2 (expt 3 n2) n2 small_bound 1.0 #f) 3)

;; (- (root n2 (expt 3 n2) 1 1.0) 3) will have `y` sequence including the loop above. 

;; (- (root n2 (expt 3 n2) n2 1.0) 3) will have `y` sequence: 
; 1.0 
; 637621501.2140495 
; 637621501.2140489

;;; compare floor and ceil for log n
(define (log_base base n)
  (/ (log n) (log base)))
(define (find_floor_worse_than_ceil use_power_plus_one init_exp base count init ending_exp)
  (define n ((if use_power_plus_one
                  +
                  -) (expt 2 init_exp) 1)) ; this will make n-floor(n) greatest for one init_exp
  (define x (expt base n))
  (define floor_average_damp_level (inexact->exact (floor (log_base 2 n))))
  (define ceiling_average_damp_level (inexact->exact (ceiling (log_base 2 n))))
  (displayln "init_exp:")
  (displayln init_exp)
  (let ((diff (- (root n x floor_average_damp_level count init #t) (root n x ceiling_average_damp_level count init #t))))
    (if (> diff 0)
      (displayln "ceiling better")
      (displayln "floor better"))
    (if (= init_exp ending_exp)
      (displayln "finish")
      (find_floor_worse_than_ceil use_power_plus_one (+ init_exp 1) base count init ending_exp))))

(define big_bound (* small_bound 10))
(define base 1.1)
;; Here init_exp=1 will floor to 0 which is not considered in repeated.
(find_floor_worse_than_ceil #f 2 base big_bound 1.0 10)
;; the above will change from "ceiling better" to "floor better" when init_exp change from 6 to 7 when base=1.1.
;; result will become inf (in Racket)/nan (in MIT/GNU Scheme) when init_exp becomes 10 if choosing base=3 since I calculate $\sqrt[2^n-1]{base^{2^n-1}}=base$ to test the result correctness.
(find_floor_worse_than_ceil #t 1 base big_bound 1.0 10) 
;; the above only have "ceiling better" for init_exp=1.

(find_floor_worse_than_ceil #f 3 3 big_bound 1.0 4)
;; Here when `init_exp=3`, 
;; floor will first map to one further point $y_1$ due to the low slope, then map to one point $y_2$ closer to the zero point $z<y_2$, then step by step converge to $z$.
;; ceil will do the inverse, i.e. map to one relatively closer point $y_2$ compared with floor and $y_2‘$ further from $z$ than $y_2$ ...
;; In summary, floor will do worse at the 1st step but better in the latter steps while ceil is the inverse situation.
;; So normally, floor will do better. But we need larger latter step number to amortize, i.e. when `init_exp` is small ceil may do better.
;;
;; the above will output
; init_exp:
; 3
; average_damp_level:
; 3
; fixed_point_bound:
; 1.
; 274.25
; 239.96875000000063
; 209.972656250002
; ...
; 3.000002412349743
; finished count:
; 42
; average_damp_level:
; 2
; fixed_point_bound:
; 1.
; 547.5
; 410.625
; 307.9687500000001
; ...
; 3.0000074196296165
; 2.999994435374126
; finished count:
; 55
; ceiling better
; init_exp:
; 4
; average_damp_level:
; 4
; fixed_point_bound:
; 1.
; 896807.625
; 840757.1484375
; ...
; 3.000037933721064
; 3.0000023740050947
; finished count:
; 202
; average_damp_level:
; 3
; fixed_point_bound:
; 1.
; 1793614.25
; 1569412.46875
; 1373235.91015625
; ...
; 2.9999951975788592
; finished count:
; 166
; floor better
;;