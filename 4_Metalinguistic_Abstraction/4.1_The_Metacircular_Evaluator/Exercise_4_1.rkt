#lang racket/base

; origin version
(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    (cons (eval (first-operand exps) env)
          (list-of-values (rest-operands exps) env))))

; evaluates from left to right
(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    ;; https://docs.racket-lang.org/reference/let.html
    ;; > The first form evaluates the val-exprs left-to-right
    ;; is different from MIT_Scheme_Reference https://www.gnu.org/software/mit-scheme/documentation/stable/mit-scheme-ref/Lexical-Binding.html#index-let-1
    ;; > The inits are evaluated in the current environment (in some unspecified order)
    (let ([left (eval (first-operand exps) env)]
          [right (list-of-values (rest-operands exps) env)])
      (cons left right))))

; evaluates from right to left
(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    (let ([right (list-of-values (rest-operands exps) env)]
          [left (eval (first-operand exps) env)])
      (cons left right))))
