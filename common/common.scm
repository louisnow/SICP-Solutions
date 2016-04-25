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
  (define (sqrt-iter guess prev-guess)  
    (define (improve guess)
      (average guess (/ x guess)))
    (define (good-enough? guess prev-guess)
      (< (abs (- guess prev-guess)) 0.0001))
    (if (good-enough? guess prev-guess)
        guess
        (sqrt-iter (improve guess) guess)))
  (sqrt-iter 1.0 0))

;Cube root
(define (cube-root x) 
  (define (cube-root-iter guess prev-guess)  
    (define (improve guess)
      (/ (+ (* 2 guess) (/ x (sq guess))) 3))
    (define (good-enough? guess prev-guess)
      (< (abs (- guess prev-guess)) 0.0001)) 
    (if (good-enough? guess prev-guess)
        guess
        (cube-root-iter (improve guess) guess)))
  (cube-root-iter 1.0 0))

(provide (all-defined-out))
