# 1a
(list (cons 2 3) 4)
(list (2 . 3) 4)
=> ((2 . 3) 4)


# 1b
(append (cons '(a) '(b)) '(c))
(cons (a) (b)) -> ((a) b)
(append ((a) b) (c))
=> ((a) b c)

#1c
(cdadar '((e (f) g) h))
(cdadr (e (f) g))
(cdar ((f) g))
=> '()

3
#2a
=> cadadr

1

#3

(define make-segment (p1 p2) (tag 'segment (cons p1 p2)))
(define start-segment (s) (caadr s))
(define end-segment (s) (cadadr s))
(define mid-point (s) 
    (cond 
        ((eq? (tag s) 'segment) ())
        ((eq? (tag s) 'frame) ())
        (else #f))
)

5

#4
(define (sum-leaf tree) 
    (+ (datum tree) (sum (children tree))))
    
(define (maxpath tree)
    (define (accumulate tree)
        (if (empty? (children tree)) (datum tree)
        (cons (sum-leaf tree) (map (lambda (child) (accumulate child)) (childen tree)))))
    (biggest (accumulate tree)))
    3

#5
1

#6

(define (transition fsm n letter) 
    (let (state (first (lambda (s) (and (eq? (car s) num) (eq? (cadr s) num))) fsm)))
    (if (empty? state) 0
    (caddr state)
    ))

(transition fsm 1 'C)

(define (process fsm n letters)
    (if empty? letters) (caddr state)
    (process fsm (transition fsm n (car letters)) (cdr letters))
(process fsm 1 'AACCAAB)
5

#7a
=>f
=>t
=>f
=>f
=>t
=>f
3

#7b
=>class
=>instance
1

28
22