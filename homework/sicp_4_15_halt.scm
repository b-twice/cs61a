(define (run-forever) (run-forever))
(define (try p)
    (if (halts? p p) (run-forever) 'halted))

(define (p a))

; given a one argument procedure p

(define (p a))

; and an object a

; is said to halt on a if evaluating (p a) returnes a value

(p a) ; => value

(try try)


; (if (halts? try try))

; the contradiction is try is attempting to run while halt is attempting to stop
; try can't stop but halt can't let it run forever