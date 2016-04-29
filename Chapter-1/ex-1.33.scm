#lang sicp
;ex 1.33
(#%require "../common/common.scm")
;recursive
(define (filtered-accumulate filter combiner null-value a b term next)  
  (if (> a b)      
      null-value
      (if (filter a) 
          (combiner (term a) (filtered-accumulate filter combiner null-value (next a) b term next))
          (filtered-accumulate filter combiner null-value (next a) b term next))))
;sum of squares of primes only upto n
(filtered-accumulate prime?
                     +
                     0
                     1
                     5
                     (lambda (x) (* x x))
                     (lambda (x) (+ x 1)))
;4+9+25 = 38

;product of relatively prime numbers to n only in the range: 1 to n
;relative prime: gcd(i, n) = 1 where i: 1 <= x <= n
(let ((n 5))
  (filtered-accumulate (lambda (x) (= (gcd x n) 1))
                       *
                       1
                       1
                       n
                       (lambda (x) x)
                       (lambda (x) (+ x 1))))
;1*2*3*4 = 24
