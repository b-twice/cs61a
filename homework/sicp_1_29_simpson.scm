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

; Where I struggled is that a is constant
; and you are just incrementing by 1
; then applying the formula of yk = f(a + kh)
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