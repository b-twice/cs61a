(define (subsets s)
    (if (null? s) (list 0)
        (let ((rest (subsets (cdr s))))
            (append rest (map (lambda (r) (cons (car s) r)) rest)))))

; not sure why this doens't print correctly...gT
(subsets (list 1 2 3))