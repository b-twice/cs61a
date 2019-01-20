(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt1 x)
  (sqrt-iter 1.0 x))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    ((iterative-improve close-enough? f) first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               2.0))

(define (iterative-improve guess-good-enough? improve-guess) 
    (define (try guess) 
        (let ((next (improve-guess guess)))
            (if (guess-good-enough? guess next) 
                next 
                (try next))))
    (lambda (guess) (try guess)))


; (sqrt1 9)
; (sqrt 9)

(fixed-point (lambda (y) (+ 1 (/ 1 y)))
            2.0)
