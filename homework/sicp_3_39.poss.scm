(define x 10)
(define s (make-serializer))
(parallel-execute
;  the lambda could be passed one of two options, 10 or 11
; since the lambda is serialized the * x x will always multiple the same value
(lambda () (set! x ((s (lambda () (* x x))))))
; x could be 10 or 100 depending if p1 goes first 
(s (lambda () (set! x (+ x 1)))))

;  110 isn't possible beacuse p1 lambda is serialized
; 11 isn't possible because one set has to occur before or after the other and the lambdas
; cnt be interupted