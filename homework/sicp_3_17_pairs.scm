
(define (count-pairs l)
    (let ((pairs '()))
        (define (count x) 
            ; memq does a pointer comparison, not just value
            (if (or (not (pair? x)) (memq x pairs))
                0
                (begin 
                (set! pairs (cons x pairs))
                (+ (count (car x))
                (count (cdr x))
                    1))))
    (count l)))


(define x (list 'a 'b))
(count-pairs (list x))
(define x (list 'a))
(count-pairs (list (cons x x)))
(define x (list 'a))
(count-pairs (cons (cons x x) (cons x x)))
