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
; (define (accumulate combiner null-value term a next b)
;     (define (iter a result)
;         (if (> a b)
;             result
;             (iter (next a) (combiner result (term a)))))
;     (iter a null-value))

;FILTERED ACCUMULATE - RECURSIVE
(define (accumulate combiner filter? null-value term a next b)
        ; (* (cond ((odd? k) 4)
        ;          ((or (= k 0) (= k n)) 1)
        ;          ((even? k) 2))
        ;     (y k)))

    (cond ((> a b) null-value)
    ((filter? a) (combiner (term a) (accumulate combiner filter? null-value term (next a) next b)))
    ((accumulate combiner filter? null-value term (next a) next b))))


(define (square x) (* x x))

(define (fast-prime? n)
   (define (smallest-divisor n)
      (define (find-divisor n test-divisor)
         (define (next x)
            (if (= x 2) 3 (+ x 2)))
         (define (divides? a b)
            (= (remainder b a) 0))
         (cond ((> (square test-divisor) n) n)
               ((divides? test-divisor n) test-divisor)
               (else (find-divisor n (next test-divisor)))))
      (find-divisor n 2))
   (= n (smallest-divisor n)))

(define (prime-sum a b) 
    (define (combiner a b) (+ a b))
    (define (inc a) (+ a 1))
    (accumulate combiner fast-prime? 0 square a inc b))

(define (gcd a b)
   (if (= b 0)
       a
       (gcd b (remainder a b))))

(define (prime-product n)
   (define (coprime? a)
      (= (gcd a n) 1))
   (define (identity x) x)
   (define (combiner a b) (* a b))
   (define (inc a) (+ a 1))
   (accumulate combiner coprime? 1 identity 1 inc n))

(prime-product 10)