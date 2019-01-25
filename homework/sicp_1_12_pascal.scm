(define (pascal n) 
    (cond ((= n 0) 1)
        ((= n 1) 3)
        ((+ (expt 2 n) (pascal (- n 1))))))

(pascal 1)
(pascal 2)
(pascal 3)
(pascal 4)