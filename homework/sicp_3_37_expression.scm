(define (celsius-fahrenheit-converter x)
    (c+ (c* (c/ (cv 9) (cv 5))
        x)
    (cv 32)))

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))

(define (c+ x y)
    (let ((z (make-connector)))
        (adder x y z)
        z))
    
    
(define (c- x y)
    (let ((z (make-connector)))
        (adder z y x)
        z))

(define (c* x y)
    (let ((z (make-connector)))
        (multiplier x y z)
        z))

(define (c/ x y)
    (let ((z (make-connector)))
        (multiplier z x y)
        z))

(define (cv x)
    (let ((z (make-connector)))
        (constant x z)
        z))