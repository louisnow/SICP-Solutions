#lang sicp
(#%require "../common/common.scm")
;ex 1.15
;I'm using display, bit of a cheat but no matter.
;It's tempting to think of this as exponential at first glance.
;But look at the reduction of 'angle' at every call, it's reduced by 3 or 3^n at n steps.
;I'd like to think of it like this;
;If it's reduced exponentially then it grows logrithmically. This sentence might be wrong. But look at the exponetial and logrithmic graphs,
;they can fit on top of each other perfectly if you remove the axes.
;so it grows at O(log3 a)

(define (p x)
  (- (* 3 x) (* 4 (cube x))))
                   
(define (sine angle)
  (display angle) (newline)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
(sine 12.15)
