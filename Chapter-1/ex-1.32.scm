#lang sicp
;ex 1.32
;recursive
(define (accumulate combiner null-value a b term next)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value (next a) b term next))))
;sum
(accumulate +
            0
            1
            5
            (lambda (x) x)
            (lambda (x) (+ x 1)))
;product
(accumulate *
            1
            1
            5
            (lambda (x) x)
            (lambda (x) (+ x 1)))
;iterative
;recursive
(define (accumulate-iter combiner null-value a b term next)
  (define (iter result a) 
    (if (> a b)
        result
        (iter (combiner result (term a)) (next a))))
  (iter null-value a))
;sum
(accumulate-iter +
            0
            1
            5
            (lambda (x) x)
            (lambda (x) (+ x 1)))
;product
(accumulate-iter *
            1
            1
            5
            (lambda (x) x)
            (lambda (x) (+ x 1)))