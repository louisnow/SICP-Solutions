#lang sicp
;ex 1.6
(#%require "../common/common.scm")
;the new if clause Alyssa made
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
;using the new if similar to the one in the textbook
(define (sqrt1 x) 
  (define (sqrt-iter guess)  
    (define (improve guess)
      ;(display (average guess (/ x guess)))
      (average guess (/ x guess)))
    (define (good-enough? guess)
      (< (abs (- (sq guess) x)) 0.001))    
    (new-if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
;infinite recursive calls to itself
;this had me stumped for longer than I expected
;the key to understanding this is found in section 1.1.6
;the if/cond statements in Scheme are special in that they do not have the applicative order evaluation property
;the new-if procedure we created actually evaluates the else clause immediately.
;As soon as we pass in the value to the function, it tries to resolve the parameter 'else-clause'.
;Thus it calls 'sqrt-iter' repeatedly, unable to check for the base case, forever getting close to the answer. Uncomment the display line to see for yourself.
;This is unlike the if/cond statements in scheme where evaluation only takes place for the clause that satisfies the condition
;Is this why Haskell is Lazy eval? I don't know, I'm pulling at straws here.
;This is exciting as mentioned in footnote number 52, using normal order eval for
;potentially infinite data processing (streams), vague idea forming of how this will work
(sqrt1 2)