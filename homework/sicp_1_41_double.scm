(define (inc x) (+ x  1))
(define (double f) (lambda (x) (f (f x))))

; gets called 16 times
(((double (double double)) inc) 5)

