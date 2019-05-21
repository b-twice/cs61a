; interlaving combination
; 2 values for overwriting eachother (100, 1000)
; 1 value for a sequence 100^3 or 1000^2
; value for 100^2 if interlave with P2
; value for 10*100*100 for interlave with p2 
(define x 10)
(parallel-execute (lambda () (set! x (* x x)))
(lambda () (set! x (* x x x))))



; 100^3 == 1000^2
(define x 10)
(define s (make-serializer))
(parallel-execute (s (lambda () (set! x (* x x))))
(s (lambda () (set! x (* x x x)))))