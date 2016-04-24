#lang sicp
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
(test 0 (p))
;applicative order evaluation
;infinite loop p -> p -> p -> ....

;normal order evaluation
;if condition is true so y is not evaluated as there isn't a need for it
;output : 0