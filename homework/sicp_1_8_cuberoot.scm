;cube-root

(define (cube-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (good-enough? guess nextGuess)
  (< (abs (- guess nextGuess)) 0.001))


(define (cube-root x)
    (cube-iter 1.0 x))