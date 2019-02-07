; sicp problems solved in hw 

(define (mystery l1 l2) 
    (cons (append l1 l2) l2))

(mystery (list 1 2) (list 3 4))
; (cons (list 1 2 3 4) (list 3 4))
; ((1 2 3 4) 3 4)
