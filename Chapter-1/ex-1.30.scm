#lang sicp
;ex 1.30
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
;iterative sum function,1+2+3 = 6
(sum (lambda (x) x) 1 inc 3)
