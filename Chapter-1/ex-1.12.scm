#lang sicp
;ex 1.12
;Pascal's Triangle
;    1   2   3   4   5   
;1   1   0   0   0   0
;2   1   1   0   0   0
;3   1   2   1   0   0
;4   1   3   3   1   0
;5   1   4   6   4   1
;From the matrix above you can see that for every element at [row col]
;if row and column = [1 1] return 1
;else add [row-1 col] and [row-1 col-1]
(define (pascal row col)
  (cond ((and (= row 1) (= col 1)) 1)
        ((or (< row 1) (< col 1)) 0)
        ((> col row) 0)
        ((+ (pascal (dec row) col) (pascal (dec row) (dec col))))))

;When trying to arrive at recursive solutions, you've got to have faith like Indiana Jones (to make the leap! yay movie puns!) 
;'Wishful Thinking' like Abelson and Sussman said
(pascal 1 1)
(pascal 2 1)
(pascal 2 2)
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)
(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)
(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 5 5)
