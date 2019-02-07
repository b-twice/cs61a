(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
    (list length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

(define (weight branch)
    (if (pair? (branch-structure branch))
        (total-weight (branch-structure branch))
        (branch-structure branch)
    ))

(define (total-weight mobile)
    (if (null? mobile) 0
    (+ (weight (left-branch mobile))
        (weight (right-branch mobile)))))

(define (branch-torque branch) 
    (* (branch-length branch) (weight branch)))

(define (balanced mobile)
    (if (equal? (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile))) #t
    #f))

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))
a
b

(total-weight a)
(total-weight b)
(balanced a)
(balanced b)

(define c (make-mobile (make-branch 5 a) (make-branch 3 b)))
c
(total-weight c)
(balanced c)

(define d (make-mobile (make-branch 10 a) (make-branch 12 5)))
d
(balanced d)