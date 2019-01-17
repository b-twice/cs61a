; RECURSIVE
; (define (sum term a next b)
;   (if (> a b)
;       0
;       (+ (term a)
;          (sum term (next a) next b))))


; (define (product term a next b)
;   (if (> a b)
;       1
;       (* (term a)
;          (product term (next a) next b))))

;ITERATIVE
; (define (product term a next b)
;   (define (iter a result)
;     (if (> a b)
;         result
;         (iter (next a) (* result (term a))))) ;accumulate sum
;   (iter a 1))

; (define (sum term a next b)
;   (define (iter a result)
;     (if (> a b)
;         result
;         (iter (next a) (+ result (term a))))) ;accumulate sum
;   (iter a 0))

;ACCUMULATE 
(define (sum term a next b)
    (define (combiner a b) (+ a b))
    (accumulate combiner 0 term a next b))

(define (product term a next b)
    (define (combiner a b) (* a b))
    (accumulate combiner 1 term a next b))

;RECURSIVE
; (define (accumulate combiner null-value term a next b)
;     (if (> a b)
;         null-value
;     (combiner (term a) (accumulate combiner null-value term (next a) next b))))

;ITERATIVE
(define (accumulate combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner result (term a)))))
    (iter a null-value))

(define (integral f a b dx) 
    (define (add-dx x) 
        (+ x dx)) 
    (* (sum f (+ a (/ dx 2.0)) add-dx b) 
        dx))

(define (cube x) (* x x x))


(define (factorial a) 
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (product identity 1 inc a))

(integral cube 0 1 0.001)
(factorial 5)