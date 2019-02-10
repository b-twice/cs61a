(define (make-vect x y) (list x y))
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cadr vect))

(define (add-vect v1 v2) 
    (make-vect (+ (xcor-vect v1) (xcor-vect v2)) (+ (ycor-vect v1) (ycor-vect v2)))
)
(define (sub-vect v1 v2) 
    (make-vect (- (xcor-vect v1) (xcor-vect v2)) (- (ycor-vect v1) (ycor-vect v2)))
)
(define (scale-vect v s) (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))


(add-vect (make-vect 1 2) (make-vect 3 4))
(sub-vect (make-vect 1 2) (make-vect 3 4))
(scale-vect (make-vect 1 2) 2)