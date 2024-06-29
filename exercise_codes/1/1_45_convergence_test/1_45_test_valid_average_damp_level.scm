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
      ; (displayln guess)
      (if (or (close-enough? guess next) (= count bound))
          (begin 
            ; (displayln "finished count:")
            ; (displayln count)
            (displayln next)
            (if whether_output_cnt
              count
              next))
          (try next (+ count 1)))))
  ; (displayln "fixed_point_bound:")
  (try first-guess 1))

(define small_bound 100)
; (define (init_map x y n) 
;   (/ x ((repeated (lambda (m) (* y m)) (- n 1)) 1))) 
(define (root n x average_damp_level bound init whether_output_cnt) 
  ; (define transformed_f ((repeated average-damp average_damp_level) (lambda (y) (init_map x y n)))) 
  ;; same as Kaihao's implementation, otherwise the above will output differently although it also converges
  (define transformed_f ((repeated average-damp average_damp_level) (lambda (y) (/ x (expt y (- n 1)))))) 
  ; (displayln "average_damp_level:")
  ; (displayln average_damp_level)
  (fixed_point_bound transformed_f init bound whether_output_cnt)) 
(define n2 50)
;;; same as the wiki parameter choice.
(define (find_valid_average_damp_level max_root start_root bound init)
  (define x 2.0)
  (define (helper root_order average_damp_level)
    (if (< (root root_order x average_damp_level bound init #t) bound)
      (begin
        (displayln "needed average_damp_level:")
        average_damp_level)
      (helper root_order (+ average_damp_level 1))))
  (if (> start_root max_root)
    (displayln "finish")
    (begin
      (displayln "")
      (displayln "start_root:")
      (displayln start_root)
      (displayln (helper start_root 1))
      (find_valid_average_damp_level max_root (+ start_root 1) bound init))))
(find_valid_average_damp_level 20 2 small_bound 1.0)

;;; check how $sqrt[6]{2}$ converges when "Required Average Damps" is 1.
(root 6 2.0 1 1000000000 1.0 #t)
;; outputs with the same result as the following `(nth-root 2.0 6 1)`.
; 1.1224584896267153
;Value: 319396

;;; from wiki Kaihao's comment
(define tolerance 0.00001) 
  
(define (fixed-point f first-guess) 
  (define (close-enough? v1 v2) 
    (< (abs (- v1 v2)) tolerance)) 
  (define (try guess) 
    (let ((next (f guess)))
      ; (displayln next) 
      (if (close-enough? guess next) 
        next
        (try next)))) 
  (try first-guess)) 

(define (average a b) 
  (/ (+ a b) 2)) 

(define (average-damp f) 
  (lambda (x) (average x (f x)))) 

(define (square x) 
  (* x x)) 

(define (fast-expt b n) 
  (cond ((= n 0) 1) 
        ((even? n) (square (fast-expt b (/ n 2)))) 
        (else (* b (fast-expt b (- n 1)))))) 

(define (compose f g) 
  (lambda (x) 
    (g (f x)))) 

(define (repeated f n) 
  (if (> n 1) 
    (compose (repeated f (- n 1)) f) 
    f)) 

;; avarage-damp d times 
(define (nth-root x n d) 
  (fixed-point ((repeated average-damp d)  
                ; (lambda (y) (/ x (fast-expt y (- n 1))))) 
                ;; `fast-expt` seems to be same as the internal `expt` since they have the same result.
                (lambda (y) (/ x (expt y (- n 1))))) 
              1.0))
(nth-root 2.0 6 1)