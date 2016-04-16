#lang racket
;Recursive Lambda function in scheme
;this magical program which eventually leads to Y Combinators blows my mind
;GCD using euclid's algorithm
(((lambda (f)( f f))
 (lambda (myself)
  (lambda (a b)
    (cond
      ((= b 0) a)
      (else((myself myself) b (modulo a b)))
      )
    )
  )
 )
10 5)