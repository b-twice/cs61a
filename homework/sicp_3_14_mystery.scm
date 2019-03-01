(define (mystery x)
    (define (loop x y)
        (if (null? x) y
        (let ((temp (cdr x)))
            (set-cdr! x y)
            (loop temp x))))
    (loop x '()))

(define v (list 'a 'b 'c 'd))
; go in set (list 'a '())
; then you have ('b 'c 'd) as the x and ('a '()) as the y
; then you have ('c 'd) as the x and ('d 'c 'b 'a '()) as the y
(define w (mystery v))        
; does it just reverse?
w
; yes! its a backwards way of setting a list
