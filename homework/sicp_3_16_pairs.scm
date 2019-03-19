(define (count-pairs x)
    (if (or (not (pair? x)) (null? x))
        0
        (count-pairs (car x)
        (count-pairs (cdr x))
            1)))

(define x (list 'a 'b))
(count-pairs (list x))
; 3
(define x (list 'a))
(count-pairs (list (cons x x)))
;4

(define x (list 'a))
(count-pairs (cons (cons x x) (cons x x)))
