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

(define x (list (list 1 2) (list 3 4)))

(reverse x)

(define (deep-reverse l) 
    (display l)
    (if (list? l) (map (lambda (el) (deep-reverse (cdr x))) l) (reverse l)))
            

(deep-reverse x)
