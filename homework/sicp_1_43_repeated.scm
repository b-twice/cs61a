(define (inc x) (+ x  1))
(define (square x) (* x x))
(define (compose f g) (lambda (x) (f (g x))))

(define (repeat f x) 
    (if (= x 1) f
    (compose f (repeat f (- x 1)))))


((repeat square 3) 5)

