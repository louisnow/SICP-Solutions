#lang racket
;Square
(define (sq x) (* x x))

;Cube
(define (cube x) (* x x x))

;Average
(define (average a b)
    (/ (+ a b) 2))

;Square root
(define (sqrt x) 
  (define (sqrt-iter guess)  
    (define (improve guess)
      (average guess (/ x guess)))
    (define (good-enough? guess)
      (< (abs (- (sq guess) x)) 0.001))    
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
(provide (all-defined-out))
