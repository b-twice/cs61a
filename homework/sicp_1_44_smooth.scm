(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f x) 
    (if (= x 1) f
    (compose f (repeated f (- x 1)))))

(define (smooth fn dx)
    (lambda (x) 
        (/ (+ (fn (- x dx)) (fn x) (fn (+ x dx))) 3)))

(define (n-fold-smooth fn dx count) 
    ; don't need to wrap in lambda, already returns a lambda duh...
    ; (lambda (x) ((repeated (smooth fn dx) count) x)))
    (repeated (smooth fn dx) count))

; no idea how to evaluate so used bill the lizard blog
((n-fold-smooth sin 0.7 2) (/ 3.1408077460303945 2))
((n-fold-smooth sin 0.7 3) (/ 3.1408077460303945 2))
((n-fold-smooth sin 0.7 4) (/ 3.1408077460303945 2))