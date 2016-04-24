#lang sicp
;ex 1.32
;taking a pause to work through all the previous exercises
;recursive
(define (filtered-accumulate filter combiner null-value a b term next)
  (if (filter a b)
      null-value
      (combiner (term a) (filtered-accumulate filter combiner null-value (next a) b term next))))
;sum
(filtered-accumulate prime?
                     +
                     0
                     1
                     5
                     (lambda (x) (* x x))
                     (lambda (x) (+ x 1)))
