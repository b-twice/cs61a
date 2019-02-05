
(define (x) (list 1 3 (list 5 7) 9))
; (cdr (x))
(car (cdr (car (cdr (cdr (x))))))
(define (x) (list (list 7)))
(car (car (x)))
(define (x) (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (x)))))))))))))
; massochism