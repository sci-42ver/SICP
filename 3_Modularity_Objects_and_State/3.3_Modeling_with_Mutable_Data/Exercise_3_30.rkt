#lang racket/base

; https://github.com/xxyzz/nand2tetris/blob/master/02/Add16.hdl

(define (half-adder a b s c)
  (let ([d (make-wire)] [e (make-wire)])
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))

(define (full-adder a b c-in sum c-out)
  (let ([s (make-wire)] [c1 (make-wire)] [c2 (make-wire)])
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

(define (ripple-carry-adder A-wire-list B-wire-list S-wire-list C-wire)
  (let ([carry (make-wire)])
    ;; See LisScheSic's 1st comment in wiki.
    ; (full-adder (car A-wire-list) (car B-wire-list) C-wire (car S-wire-list) carry)
    ;; IMHO Here we should let C-wire be c-out.
    (full-adder (car A-wire-list) (car B-wire-list) carry (car S-wire-list) C-wire)
    (if (null? (cdr A-wire-list))
      (set-signal! carry 0)
      (ripple-carry-adder (cdr A-wire-list) (cdr B-wire-list) (cdr S-wire-list) carry))))

; delays = n * full-adder delay = n * (2 * falf-adder delay + or gate delay)
;; This is wrong since we are caring about C_out delay in full-adder here (implied by the above).
;; Then for half we only needs to care about ->S->C instead of ->S->S here.
; = n * (2 * ((max (or-gate, (and-gate + inverter)) + and-gate)) + or gate delay)
