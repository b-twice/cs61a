; Ben says unless can be implemented in special form in applicative order
; Alyssa says that's just syntax and not procedure that can be used in higher order procedures
(define (unless condition usual-value exceptional-value) 
    (if condition exceptional-value usual-value)) 

; unlesss
(define (unless? exp) (tagged-list exp 'unless))
(define (unless-base exp) (cdr exp) )
(define (unless-condition base) (car base) )
(define (unless-usual-value base) (cadr base) )
(define (unless-exceptional-value base) (caddr base) )

(define (unless->if exp) (expand-unless (unless-base exp))   
(define (expand-unless base) 
    (make-if (unless-condition base) (unless-exception-value base) (unless-usual-value base))
)

; can't think of an example where unless would be used as a procedure, perhaps some sort of
; logic driven high level of abstraction