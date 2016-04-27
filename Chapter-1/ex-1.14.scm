#lang sicp
;ex 1.14
;1:1  2:5  3:10  4:25  5:50
;to see how 1 -> 11 and similar terms reduce to 1 see file Section 1.2.2 Counting change in this folder
;Subtress that reappear are not expanded
;                                                                                         1,2,3,4,5 -> 11     
;                                                                      1,2,3,4 -> 11                            1,2,3,4,5 -> -39 (11-50)
;                                                  1,2,3 -> 11                         1,2,3,4 -> -14 (11-25)            0 
;                         1,2->11                                1,2,3 -> 1                     0
;           1 -> 11               1,2 -> 6                1,2->1        1,2,3->-9      
;              1          1 -> 6          1,2 -> 1           1               0
;                            1        1->1     1,2->-4
;                                       1          0
; From tree we get the answer 4. To verify, just run the program
(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination
                         kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
(count-change 11)