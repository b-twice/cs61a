(define (for-each fn items)
    (define (iter result l)
        (if (null? l) #t
        (iter (fn (car l)) (cdr l))))
    (iter #t items))

(for-each (lambda (x)
    (newline)
    (display x))
    (list 57 321 88))