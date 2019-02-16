

(put-coercion 'raise 'integer (lambda (x) (make-rat (contents x) 1)))
(put-coercion 'raise 'rational (lambda (x) (make-real (/ (numer (contents x)) (denom (contents x)) 1)))
(put-coercion 'raise 'real (lambda (x) (make-complex-from-real-imag (contents x) 0)))

 (define (raise x) (apply-generic 'raise x)) 