; forgot to do previous week labs ><
(define (make-rational num den)
    (cons num den))
(define (numerator rat)
    (car rat))
(define (denominator rat)
    (cdr rat))
(define (*rat a b)
    (make-rational (* (numerator a) (numerator b))
    (* (denominator a) (denominator b))))
(define (print-rat rat)
    ((numerator rat) '/ (denominator rat)))

; 5 add rational #s
(define (+rat a b)
    (make-rational (+ (* (numerator a) (denominator b)) 
                      (* (numerator b) (denominator a)))
                    (* (denominator a) (denominator b))))

; (print-rat (make-rational 2 3))
; (print-rat (*rat (make-rational 2 3) (make-rational 1 4)))


; 7  think about sentences

(car '(a (b c) d))
(cdr '(a (b c) d))
(car (cdr '(a (b c) d)))

; 8 reverse a list using cons,car and cdr

(define (reverse l)
    (if (null? l) '()
    (append (reverse(cdr l)) (list (car l)))))

(trace reverse)
(reverse (list 1 2 3 4))