# My Solutions to SICP
The purpose of this repository is to organize all of the Scheme code I write while I go through Structure and Interpretation of Computer Programs.

All of the code here can be run on DrRacket which is freely available on any platform.

## Setup

Download and install [DrRacket](https://racket-lang.org/).

Follow the instructions to set up [Scheme for SICP](http://docs.racket-lang.org/sicp-manual/index.html).

Here is an example to include another file into your program.

Lets say you have a file called ```lib.scm```:

```
#lang racket 
(define (sq x) (* x x))
(define (cube x) (* x x x))
(provide (all-defined-out))
```
Let's go over this, I have a file with some functions that I'd like to call elsewhere. The last line ```(provide (all-defined-out)``` is a method in Racket to make public all of the functions defined in the file. This method is only available in racket which is why we don't use ```#lang sicp``` here.

Now, to use the above program in another file, let's say ```test.scm``` just include the line ```(#%require <relative path to file>)```:

```
#lang sicp
(#%require "lib.scm")
(sq 5)
```  

#### Sources

[Scheme for SICP](http://docs.racket-lang.org/sicp-manual/index.html) , [StackOverflow](http://stackoverflow.com/questions/4809433/including-an-external-file-in-racket)
