#lang sicp

(define (require p) (if (not p) (amb)))

(define (an-integer-starting-from n)
  (amb n (an-integer-starting-from (+ n 1))))

(define (an-integer-between a b)
  (require (<= a b))
  (amb a (an-integer-between (+ a 1) b)))

;; same as wiki meteorgan's
(define (pythagorean-triple)
  (let* ([k (an-integer-starting-from 1)]
         [j (an-integer-between 1 k)]
         [i (an-integer-between 1 j)])
    (require (= (+ (* i i) (* j j)) (* k k)))
    (list i j k)))

(define (a-pythagorean-triple)
  (let* ([i (an-integer-starting-from 1)]
         [j (an-integer-starting-from i)]
         [k (an-integer-starting-from j)]) ;; struck here with i and j are 1
    (require (= (+ (* i i) (* j j)) (* k k)))
    (list i j k)))

(pythagorean-triple)
;; (3 4 5)

;; See lecs/6.001_fall_2007_recitation/codes/rec20/amb-in-underlying-scheme.scm and lecs/6.001_fall_2007_recitation/codes/rec20/amb-in-underlying-scheme-rec-version.scm
;; Here probably fail procedure is global and it is indeed.
;; https://github.com/sicp-lang/sicp/blob/5ba7b852855cf107892244b37d6a1ffbef14d595/sicp/main.rkt#L42-L61
;; is same as the schemewiki one except that 
;; 0. it restores (set-amb-fail! +prev-amb-fail) before each fail.
;; IMHO that is unnecessary. each `(+fk 'fail)` will run the next cand in ... . Then the actual usage of amb-fail is at +prev-amb-fail.
;; So just like schemewiki doing that restoration before (+prev-amb-fail) is enough.
;; 1. when no alt, it just does (amb-fail) same as schemewiki
;; 2. when one alt, no shortcut but still does the same thing.

;; TODO also see https://github.com/tojoqk/tojoqk-amb/blob/master/tojoqk/amb.rkt if interested (I skipped that~~test, contract parts~~).
(amb)

(list (begin (display "left") 1) (begin (display "right") 2))
(list (amb 1 2) (amb 3 4))
(amb)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; set!
(define global-x '(0))
(define (test y)
  (define (demo-set! x)
    (set! global-x (cons x global-x))
    global-x)
  (demo-set! y))
(test (amb 1 2))
;; set! doesn't work, maybe this is why repo skips Exercise 4.45 which needs set! being able to restore.
;; Also see SICP/4_Metalinguistic_Abstraction/4.3_Variations_on_a_Scheme_Nondeterministic_Computing/Exercise_4_49.rkt
;; TODO maybe https://docs.racket-lang.org/amb/index.html works. I skipped that since the interfaces of that share little with the book. 
(amb)
