(define (enumerate-tree tree)
   (cond ((null? tree) '())
         ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                       (enumerate-tree (cdr tree))))))

; (define (count-leaves x)
;     (cond ((null? x) 0)
;           ((not (pair? x)) 1)
;           (else (+ (count-leaves (car x))
;                 (count-leaves (cdr x))))))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
    (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))


(define x (list (list 1 3) (list 3 4)))
(count-leaves x)
(count-leaves (list x x))