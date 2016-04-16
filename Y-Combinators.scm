#lang racket
;Recursive Lambda function in scheme
;this magical program which eventually leads to Y Combinators blows my mind
;For a deeper understanding on how this works visit, http://mvanier.livejournal.com/2897
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
