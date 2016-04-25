#lang sicp
;ex 1.8
(#%require "../common/common.scm")

(define (cube-root1 x) 
  (define (cube-root-iter guess prev-guess)  
    (define (improve guess)
      (/ (+ (* 2 guess) (/ x (sq guess))) 3))
    (define (good-enough? guess prev-guess)
      (< (abs (- guess prev-guess)) 0.0001)) 
    (if (good-enough? guess prev-guess)
        guess
        (cube-root-iter (improve guess) guess)))
  (cube-root-iter 1.0 0))

(cube-root1 27)