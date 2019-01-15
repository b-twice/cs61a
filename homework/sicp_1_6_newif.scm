; original
; (define (sqrt-iter guess x)
;   (if (good-enough? guess x)
;       guess
;       (sqrt-iter (improve guess x)
;                  x)))

; new
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

 (define (improve guess x)
  (average guess (/ x guess)))                

 (define (average x y)
  (/ (+ x y) 2)) 

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))



; this is about applicative order in that the argument subexpressions 
; are always evaluated as part of calling new-if, whereas a standard if 
; only evaluates the if/else clauses based on the result of the predicate evaluation