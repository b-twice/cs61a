; (define (sum term a next b)
;   (if (> a b)
;       0
;       (+ (term a)
;          (sum term (next a) next b))))


; (define (sum term a next b)
;   (define (iter a result)
;     (if <??>
;         <??>
;         (iter <??> <??>)))
;   (iter <??> <??>))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a))))) ;accumulate sum
  (iter a 0))


(define (integral f a b dx) 
    (define (add-dx x) 
        (+ x dx)) 
    (* (sum f (+ a (/ dx 2.0)) add-dx b) 
        dx))

(define (cube x) (* x x x))

(integral cube 0 1 0.001)