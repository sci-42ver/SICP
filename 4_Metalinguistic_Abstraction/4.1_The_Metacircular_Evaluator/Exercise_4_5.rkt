#lang racket/base

(define (expand-clauses clauses)
  (if (null? clauses)
    'false    ; no clause
    (let ([first (car clauses)]
          [rest (cdr clauses)])
      (if (cond-else-clause? first)
        (if (null? rest)
          (sequence->exp (cond-actions first))
          (error "ELSE clause isn't last: COND->IF"
                 clauses))
        (make-if (cond-predicate first)
                 (if (eq? (cadr first) '=>)
                   ;; see make-lambda where body implies ending with '(). So better to use list.
                   (cons (caddr first) (cond-predicate first))
                   (sequence->exp (cond-actions first)))
                 (expand-clauses rest))))))
