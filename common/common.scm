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

;GCD
(define (gcd a b)
(if (= b 0)
a
(gcd b (remainder a b))))

;Prime?
(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (sq test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (if (> n 1)
      (= n (smallest-divisor n))
      false))


(provide (all-defined-out))
