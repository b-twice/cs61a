(define (last-pair l)
    (if (null? (cdr l)) (car l)
    (last-pair (cdr l))))

(last-pair (list 23 72 149 34))

(define (but-last l)
    (if (null? (cdr l)) '()
    (cons (car l) (but-last (cdr l)))))

(but-last (list 23 72 149 34))

(define (reverse l)
    (if (null? l) '()
    (cons (last-pair l) (reverse (but-last l)))))

(reverse (list 1 4 9 16 25))
