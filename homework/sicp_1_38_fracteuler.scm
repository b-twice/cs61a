(define (cont-frac n d k)
    (define (frac i)
        (if (> i k) (/ (n i) (d i))
        (+ (d i) (/ (n i) (frac (+ i 1))))))
    (frac 1))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
          8)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
          9)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
          10)

