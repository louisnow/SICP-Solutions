#lang sicp
;ex 1.31
;pi/4 = 0.78539816339 source: calculator
(define (term a)
  (if (even? a)
      (/ a (inc a))
      (/ (inc a) a)))
(define (next a)
  (+ a 1))
 
;Recursive process
(define (product a b term next)
  ;(display (term a))(newline)
  (cond ((> a b) 1)
        (else (* (term a) (product (next a) b term next)))))
;Iterative Process
(define (product-iter a b term next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result ))))
  (iter a 1))


(product-iter 2 10000 term next)
(product 2 10000 term next)
;0.7853588983974770481206717
;took a couple of seconds on an i7 4th gen