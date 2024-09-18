#lang racket/base

(define (base-make-table same-key?)
  (let ([local-table (mcons '*table* null)])
    (define (assoc key records)
      (cond [(null? records) null]
        [(same-key? key (mcar (mcar records))) (mcar records)]
        [else (assoc key (mcdr records))]))
    (define (lookup keys)
      (define (iter-lookup keys-list subtable)
        (if (pair? keys-list)
          (let ([subtable-or-record
                 (assoc (car keys-list) (mcdr subtable))]
                [next-key-pair (cdr keys-list)])
            (cond [(and (not (null? subtable-or-record)) (null? next-key-pair))
                   (mcdr subtable-or-record)]
              [(and (not (null? subtable-or-record)) (not (null? next-key-pair)))
               (iter-lookup next-key-pair subtable-or-record)]
              [else null]))
          null))
      (iter-lookup keys local-table))
    (define (insert! keys value)
      (define (iter-insert! keys-list subtable)
        (when (pair? keys-list)
          (let* ([current-key (car keys-list)]
                 [subtable-or-record
                  (assoc current-key (mcdr subtable))]
                 [next-key-pair (cdr keys-list)])
            (if (not (null? subtable-or-record))
              (if (null? next-key-pair)
                (set-mcdr! subtable-or-record value)
                (iter-insert! next-key-pair subtable-or-record))
              (if (null? next-key-pair)
                (set-mcdr! subtable
                           (mcons (mcons current-key value)
                                  (mcdr subtable)))
                (begin (set-mcdr! subtable
                                  (mcons (mcons current-key null)
                                         (mcdr subtable)))
                  (iter-insert! next-key-pair (mcar (mcdr subtable)))))))))
      (iter-insert! keys local-table)
      'ok)
    (define (dispatch m)
      (cond [(eq? m 'lookup-proc) lookup]
        [(eq? m 'insert-proc!) insert!]
        [else (error "Unknown operation: TABLE" m)]))
    dispatch))

(define (same-key? key-1 key-2)
  (= (round key-1) (round key-2)))
(define operation-table (base-make-table same-key?))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put (list 1 2 3) "1-2-3")
; 'ok
(put (list 3 2 1) "3-2-1")
; 'ok
(put (list 4 1) "4-1")
; 'ok
(get (list 1 2 3))
; "1-2-3"
(get (list 3 2 1))
; '"3-2-1"
(get (list 4 1))
; "4-1"
(get (list 2 2))
; '()

(define (make-table)
  (base-make-table equal?))
(define (insert! table keys value)
  ((table 'insert-proc!) keys value))

(define (lookup table keys)
  ((table 'lookup-proc) keys))

; https://stackoverflow.com/a/57190748/21294350
(current-directory "/home/czg_arch/SICP_SDF/exercise_codes/SICP/3/")
; https://docs.racket-lang.org/guide/load.html
(define-namespace-anchor a)
(parameterize ([current-namespace (namespace-anchor->namespace a)])
  ; (load "3_25_test_step.scm")
  ;Error: Mismatch special case '()
  ;; In drracket, fail for "(insert!  t2  (list  1.4142 7 )  6 )".
  (load "3_26_tests/3_25_test_step_no_nil_keys.scm"))