(define (same-parity x . z) 
    (if (odd? x) (append (list x) (filter odd? z))
    (append (list x) (filter even? z))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)