(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))                

(define (average x y)
  (/ (+ x y) 2)) 

; compare the guesses and stop within a certain tolerance
; this works so that sqrt of small numbers is not terminated prematurely 
; and for large numbers when the precision is less precise
(define (good-enough? guess nextGuess)
  (< (abs (- guess nextGuess)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

