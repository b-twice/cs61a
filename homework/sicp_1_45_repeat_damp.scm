(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
    ; (newline)
    ; (display first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        ; (newline)
        ; (display guess)
         (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g) (lambda (x) (f (g x))))
(define (repeat f x) 
    (if (= x 1) f
    (compose f (repeat f (- x 1)))))


(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(define (fourth-root x)
  (fixed-point (repeat (average-damp (lambda (y) (/ x (cube y)))) 2)
               1.0))

(define (nth-root x n count)
  (fixed-point ((repeat average-damp (/ n count)) (lambda (y) (/ x (expt y (- n 1)))))
;   (fixed-point (repeat (average-damp (lambda (y) (/ x (expt y (- n 1)))) count)
               1.0))


; (cube-root 2)
(nth-root 100 2 1)
(nth-root 1000 3 1)
(nth-root 10000 4 2)
(nth-root 100000 5 2)
(nth-root 1000000 6 2)