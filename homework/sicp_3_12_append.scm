(define (append x y)
    (if (null? x)
    y
    (cons (car x) (append (cdr x) y))))

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
z
(a b c d)
(cdr x)
; ⟨ response ⟩ => (b)
; a new list is created, x is x
(define w (append! x y))
; w
; (a b c d)
; (cdr x)
; (a b c d)
; x is mutated bolting on y to the spine of x