#lang sicp
;ex 1.4
;adds two numbers, a + b
;Irrespective of the sign of b only
; AKA :  a + |b|
(define (a-plus-abs-b a b)
  ((if (> b 0)
       +
       -)
   a
   b))
(a-plus-abs-b 2 3)
(a-plus-abs-b 2 -3)
(a-plus-abs-b -3 2)