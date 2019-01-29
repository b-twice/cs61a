(define (cons x y)
    (lambda (m) (m x y)))
(define (car z)
    (z (lambda (p q) p)))
(define (cdr z)
    (z (lambda (p q) q)))


(cons 3 4)
(car (cons 3 4))
; car calls the func returned by cons which applies x,y to the lambda of car, which returns x
(f (f2))
(f2 3 4)
(cdr (cons 3 4))