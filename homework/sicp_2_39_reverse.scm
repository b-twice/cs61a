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


(define (fold-right op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                (cdr rest))))
    (iter initial sequence))

(define (reverse sequence)
    (fold-right (lambda (x y) 
        (append y (list x)) ) '() sequence))

(define (reverse sequence)
    (fold-left (lambda (x y) 
        (append (list y) x) ) '() sequence))



(reverse (list 1 2 3 4))