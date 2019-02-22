(define-class (person name)
    (instance-vars (said '()))
    (method (say stuff) 
        (set! said stuff)
        stuff)
    (method (ask stuff) (ask self ’say (se ’(would you please) stuff)))
    (method (greet) (ask self ’say (se ’(hello my name is) name))) 
    (method (repeat) (ask self 'said)) 
)

(define-class (double-talker name)
    (parent (person name))
    (method (say stuff) (se (usual ’say stuff) (ask self ’repeat))) )
; works but doesn't allow for repeat to be called properly

(define-class (double-talker name)
    (parent (person name))
    (method (say stuff) (se stuff stuff)) )
; works but changes behavior and breaks say repat

(define-class (double-talker name)
    (parent (person name))
    (method (say stuff) (usual ’say (se stuff stuff))) )
; this is good because it allows repat to be called correctly


;HW 
;1

(define-cass (random-generator n)
    (instance-vars (count 0))
    (method (number)
        (set! count (+ count 1))
        (random n)))

;2 coke machine
(define (coke-machine cokes price)
    (instance-vars (total 0))
    (method (deposit amount) 
        (set! total (+ total amount)))
    (method (coke)
        (if (< total price)
            (raise "Not Enough Money")
            (let ((change (- total price)))
            (set! total 0)
            (set! cokes (- cokes 1))
            change)
        ))
)

;3 cards

(define-class (deck cards)
    (method (empty?) (if (eq? (count cards) 0) #t #f))
    (method (deal) (if (ask self 'empty?) '() (first cards)))
)

;4 manners

(define-class (miss-manners obj) 
    (method (please msg args) (ask obj msg args)))


;extra
