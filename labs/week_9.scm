;1 see 3.12 in hw

;2

(define x (cons 1 3))
(define y 2)

(set! (cdr x) y)
; cdr x is a primitive not a symbol
; set! must be defined on a variable

;3a
(define list1 (list (list 'a) 'b))
; list1
; (('a) 'b')
(define list2 (list (list 'x) 'y))
; (('x) 'y')
; list2
(set-cdr! (car list1) (list 'x 'b))
; okay
(set-cdr! (car list2) (list 'b))
; ; okay
list1
; ; ((a x b) b)
list2
; ; ((x b) y)

;3b
(set-car! (cdr list1) (cadr list2))

; see sicp for 4