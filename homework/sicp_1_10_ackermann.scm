(define (A x y)
    (cond ((= y 0) 0)
    ((= x 0) (* 2 y))
    ((= y 1) 2)
    (else (A (- x 1) (A x (- y 1))))))

(A 1 10) 
(A 2 4)
(A 3 3)

(define (f n) (A 0 n)) ; 2y
(define (g n) (A 1 n)) ; 2^n
(define (h n) (A 2 n)) ;
(define (k n) (* 5 n n))

(h 1)
(h 2)
(h 3)
(h 4)
(h 5)