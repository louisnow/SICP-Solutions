#lang sicp
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
(A 1 10) ; 1024
(A 2 4) ; 65536
(A 3 3) ; 65536

(define (f n) (A 0 n))
;(f n) = 2n
(f 10)

(define (g n) (A 1 n))
;(g n) = 2^n
(g 10)

(define (h n) (A 2 n))
(h 1)
(h 2)
(h 3)
(h 4)
;As you can see from this, it is tempting to think that the function is
; 2 ^ 2 ^ ... (n times)
; However in case (h 4) the answer must be 256 if the above function is true
; The real trick is this
; 2 ^ (2 ^ 2 ... n-1 times )
; there is a very subtle difference between the two functions,
; the expression in the brackets are evaluated first and then the number obtained is used as the exponent in 2 ^ n
; here is another way to write the function
; (h n) = 2^(P(n-1))
; where P(n) = 2 ^ 2 ^ ... (n times)
