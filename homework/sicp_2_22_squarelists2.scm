
(define (square-list items)
    (define (iter things answer)
    (if (null? things) 
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
   (iter items '()))


; (square-list (list 1 2 3 4))
; doesn't work becaues the item is being inserted
; into the front of the list
 


(define (square-list items)
    (define (iter things answer)
    (if (null? things) 
        answer
        (iter (cdr things) 
              (cons answer (square (car things))
                    ))))
   (iter items '()))


(square-list (list 1 2 3 4))
; each item is made into a list which is being
; wrapped by another list
; the car of cons is always a list