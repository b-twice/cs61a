; (define (product term a next b)
;   (if (> a b)
;       1
;       (* (term a)
;          (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a))))) ;accumulate sum
  (iter a 1))

(define (factorial a) 
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (product identity 1 inc a))

(define (wallispi n)
    (define (approx x) 
        (/ (* 4 (* x x)) (- (* 4 (* x x)) 1)))
    (define (inc x) (+ x 1))
    (* 2.0 (product approx 1 inc n)))

)

(wallispi 100)
(wallispi 1000)
(wallispi 10000)