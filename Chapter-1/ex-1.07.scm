#lang sicp
;ex 1.7
(#%require "../common/common.scm")
;for numbers smaller than the precision value, the square root is off by a big margin
;if the number is very big, weird things start to happen
;depending on how the compiler works and your processor, varying things can happen,
;1) loop for a long time
;2) terminate quickly becuase the CPU approximates the
;   difference of two large number (one of the numbers being squared)
;   That is ( number - sqrt(number)) = 0 for big numbers (computers can't do floating point very well)
;   This leads to random answers on my machine :
;   (sqrt 999999999999) = 999999.9999995
;   (sqrt 9999999999999) = 3162277.660168221  
;   (sqrt 99999999999909) = infinite loop
;   (sqrt 999999999999999999) = 1000000000.0

; to try to fix this issue we must improve 'good-enough?'
; stop progress when the improvement in successive runs of 'sqrt1' is minimal or gains have diminished.
(define (good-enough? guess prev-guess)
      (< (abs (- guess prev-guess)) 0.001)) 
(define (sqrt1 x) 
  (define (sqrt-iter guess prev-guess)  
    (define (improve guess)
      (average guess (/ x guess)))       
    (if (good-enough? guess prev-guess)
        guess
        (sqrt-iter (improve guess) guess)))
  (sqrt-iter 1.0 0))
;this works better than before for small values
(sqrt1 0.000000001)
;vs
(sqrt 0.000000001)
;for bigger numbers the situation isn't that great
;only improvement is that the computer now terminates, instead of a near infinite loop
(sqrt1 99999999999909)
(sqrt 99999999999909) ;better than infinite loop
