#lang sicp

(define (require p) (if (not p) (amb)))

(define (distinct? items)
  (cond [(null? items) true]
    [(null? (cdr items)) true]
    [(member (car items) (cdr items)) false]
    [else (distinct? (cdr items))]))

;; > Gabrielle's father owns the yacht that is named after Dr. Parker's daughter.
(define (verify daughter-yacht parker)
  (if (eq? (car daughter-yacht) "Gabrielle")
    (require (eq? (cdr daughter-yacht) (car parker)))))

;; 0. similar triple structure as wiki Thomas (04-2020)'s with many implicit manual filtering without using require.
;; But actually here manipulation doesn't use that triple...
;; 1. Here requirement 2 in 4_43.scm is done implicitly.
(define (weirdos)
  ;; (daughter . yacht) pair
  (let ([moore (cons "Mary Ann" "Lorna")]
        [barnacle (cons "Melissa" "Gabrielle")]
        [parker (cons (amb "Lorna" "Rosalind") "Mary Ann")]
        [colonel (cons (amb "Lorna" "Rosalind" "Gabrielle") "Melissa")])
    (require (not (eq? (car parker) (car colonel))))
    (verify colonel parker)
    (let ([hall (cons (amb "Lorna" "Gabrielle") "Rosalind")])
      (require (distinct? (list (car parker) (car colonel) (car hall))))
      (verify hall parker)
      (list (list "Mr. Moore" (car moore))
            (list "Colonel Downing" (car colonel))
            (list "Mr. Hall" (car hall))
            (list "Sir Barnacle Hood" (car barnacle))
            (list "Dr. Parker" (car parker))))))

(weirdos)
;; (("Mr. Moore" "Mary Ann") ("Colonel Downing" "Lorna") ("Mr. Hall" "Gabrielle") ("Sir Barnacle Hood" "Melissa") ("Dr. Parker" "Rosalind"))

;; Mr. Moore's daughter is unknown:
;; Just same structure with one more nesting level.
(define (weird-dads)
  (let ([barnacle (cons "Melissa" "Gabrielle")]
        ;; implicitly removes Gabrielle from daughter candidates.
        [parker (cons (amb "Lorna" "Rosalind") "Mary Ann")]
        [moore (cons (amb "Rosalind" "Gabrielle" "Mary Ann") "Lorna")])
    (require (not (eq? (car parker) (car moore))))
    (verify moore parker)
    (let ([colonel (cons (amb "Lorna" "Rosalind" "Gabrielle" "Mary Ann") "Melissa")])
      (require (distinct? (list (car parker) (car moore) (car colonel))))
      (verify colonel parker)
      (let ([hall (cons (amb "Lorna" "Gabrielle" "Mary Ann") "Rosalind")])
        (require (distinct? (list (car parker) (car moore) (car colonel) (car hall))))
        (verify hall parker)
        (list (list "Mr. Moore" (car moore))
              (list "Colonel Downing" (car colonel))
              (list "Mr. Hall" (car hall))
              (list "Sir Barnacle Hood" (car barnacle))
              (list "Dr. Parker" (car parker)))))))

(weird-dads)
;; (("Mr. Moore" "Gabrielle") ("Colonel Downing" "Rosalind") ("Mr. Hall" "Mary Ann") ("Sir Barnacle Hood" "Melissa") ("Dr. Parker" "Lorna"))
;; (("Mr. Moore" "Mary Ann") ("Colonel Downing" "Lorna") ("Mr. Hall" "Gabrielle") ("Sir Barnacle Hood" "Melissa") ("Dr. Parker" "Rosalind"))
