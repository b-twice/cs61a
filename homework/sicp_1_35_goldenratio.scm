(define (average x y) (/ (+ x y) 2))
(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
    (newline)
    (display first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (newline)
        (display guess)
         (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(sqrt 3)
(sqrt 4)
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
