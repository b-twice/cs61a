(define (make-vect x y) (list x y))
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cadr vect))

(define (make-segment v1 v2) (list v1 v2))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cadr segment))



(make-segment (make-vect 1 2) (make-vect 3 4))
(start-segment (make-segment (make-vect 1 2) (make-vect 3 4)))
(end-segment (make-segment (make-vect 1 2) (make-vect 3 4)))

