(define (enumerate-tree tree)
    (cond ((null? tree) '())
    ((not (pair? tree)) (list tree))
    (else (append (enumerate-tree (car tree))
    (enumerate-tree (cdr tree))))))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) '() sequence))
(define (append seq1 seq2)
    (accumulate cons seq2 seq1 ))
(define (length sequence)
    (accumulate (lambda (a b) (+ 1 b)) 0 sequence))

; (map square (list 1 2 3))
; (append (list 1 2 3 4 5) (list 6 7))
(length (list 1 2 4 5))