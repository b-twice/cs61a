; apply the function never
(define zero (lambda (f) (lambda (x) x)))

; apply the function once
(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (inc n) (+ n 1))

((one inc) 0)
((two inc) 0)

((add-1 zero)
((add-1 zero) inc) 0)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f (x))))
; (lambda (x) (inc (x)))
; (inc (0))
