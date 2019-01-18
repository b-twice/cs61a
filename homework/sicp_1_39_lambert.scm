(define (cont-frac n d k)
    (define (frac i)
        (if (< i k)
            (/ (n i) (+ (d i) (frac (+ i 1))))
            (/ (n i) (d i))))
    (frac 1))

(define (tan-cf x k)
  (define (d i) (- (* 2 i) 1 ))
  (define (n i)
     (if (= i 1) 
         x
         (- (* x x))))
    (cont-frac n d k))


(tan (/ 3.14 6))
(tan-cf (/ 3.14 6) 10)
