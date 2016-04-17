#lang sicp
;ex 1.29
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term
                       (next a)
                       next
                       b))))

;intutive integral of a function from a to b as in the book
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
   (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))


;simpson's rule of integration
(define (sim-integral f a b n)
  (define h (/ (- b a) n))  
  (define (term x)    
      ( * (cond ((= x n) 1)
                ((= x 0) 1)
                ((= (modulo x 2) 1) 4)
                (else 2))
          (f (+ a (* x h)))))  
  (define (next x)    
      (+ 1 x))
  
  (* (/ h 3) (sum term 0 next n )))


;integral of the function x cube between the interval 0 to 1 with dx set as 0.001
;0.24999999998662864
(integral (lambda (x) (* x x x)) 0 1 0.00001)
;1/4
(sim-integral (lambda (x) (* x x x)) 0 1 1000)