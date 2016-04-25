#lang sicp
;ex 1.11
;Recursive
(define (fr n)
  (if (< n 3)
      n
      (+ (fr (- n 1))
         (* (fr (- n 2)) 2)
         (* (fr (- n 3)) 3))))
(fr -1)
(fr 1)
(fr 2)
(fr 3)
(fr 4)
(fr 5)
(newline)
;Iterative Process

;Ok, this one is hard.
;Since I read this section of the book a while ago, I couldn't solve this problem without some help.
;What have I learnt? Solve the problems immediately after reading the relevant sections.
;Although I doubt I could have derived this completely on my own.
;I couldn't find a detailed enough explanation so I'm making one.
;Here's what I referred to http://eli.thegreenplace.net/2007/06/28/sicp-section-122

; Lets's try to intutively derive the iterative process just like the authors derived the iterative Fibonacci algorithm in the book.
; Base Cases : For now lets look at n >= 3
; f(n) = f(3)
;      = f(2) + 2f(1) + 3f(0)
;      = 2 + (2*1) + (3*0)    [since  f(2) = f(1) = f(0) = n]
;      = 4
; Ignore the multipication as it only gets in the way of seeing the pattern. 
; Here's what we end up with :
;      = 2 + 1 + 0            [since  f(2) = f(1) = f(0) = n]
; Let's look at f(4)
; f(4) = f(3)     + f(2) + f(1)
;      = (2+1+0)  + 2    + 1
; f(5) = f(4)           + f(3)    + f(2)
;      = ((2+1+0)+2+1)  + (2+1+0) + 2
; f(6) = f(5)                         + f(4)           + f(3)
;      = (((2+1+0)+2+1)+(2+1+0)+2)    + (2+1+0)+2+1)   + (2+1+0)
; As you can see from the above expansions, as n increases you just right shift the previous expansion 
; and add the entirety of the previous expansion as the first term.
; You could also draw this in a tree format if you want to.
; So the base numbers are 2, 1 and 0 and they shift places according to this rule
; X = a b c
; Y = X a b
; So X = F(Y-1)
;      = F(X)
; Apply the general equation with the multipication to X
;  F(X) = a + 2b + 3c
; where a = 2 ; b = 1 ; c= 0
; If X < 3 then we just return X itself
; All of this directly translates to

(define (f-iter a b c count)
    (if (< count 3)
        a
        (f-iter (+ a (* 2 b) (* 3 c)) a b (dec count))))
(define (fi n)
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))
    
(fi -1)
(fi 1)
(fi 2)
(fi 3)
(fi 4)
(fi 5)

;Assuming that 'n' is positive, with a little bit of insight you'll notice that we can just return 'c' instead of 'a'
;by exploitng the shift nature I mentioned above.
;In simpler terms to find f(n) -> find f(n+2) then return c instead of a
;The solution thus produced is cleaner though inefficient but it isn't quite right for negative numbers
(define (fi-clever n)
  (define (iter a b c count)
    (if (<= count 0)
        c
        (iter (+ a (* 2 b) (* 3 c)) a b (dec count))))
  (iter 2 1 0 n))

(newline)
(fi-clever -1)
(fi-clever 1)
(fi-clever 2)
(fi-clever 3)
(fi-clever 4)
(fi-clever 5)

;Here is my first attempt, it's obviously wrong but at the time I couldn't for the life of 
;me figure out how to translate a complicated recursive defintion into an iterative one. 
;I'll leave this here for your amusement.
;(define (fi n)
;  (define (iter a b c cnt)
;    (if (< cnt 3)
;        (+ a b c) 
;        (iter n (* 2 n) (* 3 n) (dec cnt))))
;  (iter 0 0 0 n))
;(fi 5)