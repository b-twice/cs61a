(define (last-pair x)
    (if (null? (cdr x)) x (last-pair (cdr x))))

(define (make-cycle x)
    (set-cdr! (last-pair x) x)
        x)

(define z (make-cycle (list 'a 'b 'c)))

; ('a 'b 'c)
; take the last pair, and set it's value to the list itself
; self referential?
z
; would the last pair refer to the list? 
; infinite loop i suppose
; something you do not want in your code
(last-pair z)