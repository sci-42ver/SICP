#lang racket/base
(require racket/stream)

;; a
(define (simple-stream-flatmap proc s)
  (simple-flatten (stream-map proc s)))
(define (simple-flatten stream)
  (stream-map stream-first
              (stream-filter (lambda (s)
                               (not (stream-empty? s)))
                             stream)))
;; simple-flatten get a stream of singleton-stream (cons s empty-stream)
;;; Wrong. we get a stream of frame since we do (stream-first (singleton-stream frame)).
;;; This is also implied that negate results may be used in conjoin, so that it must be frame-stream.

;; b: not at all
