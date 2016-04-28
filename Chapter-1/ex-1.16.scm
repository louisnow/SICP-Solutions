#lang sicp
(#%require "../common/common.scm")
;ex 1.16
;The hint is crucial
;There are 3 variables/states  a, b, n
;For even n : do (b^2) to b and reduce n to n/2, leave a as it is  [ (b^(n/2))^2 = (b^2)^n/2 ]
;For odd n : do (a*b) to a and reduce n by 1, leave b as it is
;Note how for powers of a number, eg: 2^8,
; 'a' has value 1 until the last step and 'b' holds the value 256
(define (fast-expt b n)
  (define (iter a b n)
    (cond ((= n 0) a)           
          ((even? n) (iter a (sq b) (/ n 2)))
          (else (iter (* b a) b (- n 1)))))          
  (iter 1 b n))
(fast-expt 2 1) ; 2
(fast-expt 2 2) ; 4
(fast-expt 2 3) ; 8
(fast-expt 2 4) ; 16
(fast-expt 2 5) ; 32
(fast-expt 2 7) ; 128
(fast-expt 2 8) ; 256
(fast-expt 2 10) ; 1024
