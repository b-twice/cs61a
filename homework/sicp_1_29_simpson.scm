; 
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx) 
    (define (add-dx x) 
        (+ x dx)) 
    (* (sum f (+ a (/ dx 2.0)) add-dx b) 
        dx))

; Where I struggled was the ability to interpret
; and translate the formula into code instead of 
; being able to apply higher-order functions or use lexical scoping
; This is a good thing, need to read and apply more formulas
(define (integral2 f a b n)
    (define h (/ (- b a) n))
    (define (inc x) (+ x 1))  
    (define (y k) (f (+ a (* k h))))
    (define (term k) 
        (* (cond ((odd? k) 4)
                 ((or (= k 0) (= k n)) 1)
                 ((even? k) 2))
            (y k)))
    (/ (* h (sum term 0 inc n)) 3))
        


(define (cube x) (* x x x))

(integral cube 0 1 0.001)
(integral2 cube 0 1 1000)