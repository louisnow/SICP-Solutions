#lang sicp
(#%require "../common/common.scm")
;ex 1.3
(define (larger? a b)
  (if (> a b)
      a
      b))
(define (sos a b c)
  (if (= (larger? a b) a)
      (+ (sq a) (sq (larger? b c)))
      (+ (sq b) (sq (larger? a c)))))
 
;test values
(sos 1 2 3)
(sos 3 2 1)
(sos 1 1 1)
(sos 1 1 2)
(sos 1 2 1)
(sos 2 1 1)
(sos 2 2 1)
(sos 2 1 2)
(sos 1 2 2)
