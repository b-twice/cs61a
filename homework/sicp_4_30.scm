; a
; display is a primitive so it will be forced. since no assignment technically this instance works

; b
(define (p1 x) 
    (set! x (cons x '(2))) 
    x) 
; typical mututation
(define (p2 x) 
    (define (p e) e x) 
    ; here we are passing a thunk to a fn, this could cause different behaviro
    (p (set! x (cons x '(2)))))

; (p1 1) (p2 1)
; in standard evaluator
; (p1 1) => (1 2)
; (p2 1) => (1)
; this is because the thunk would not get evaluated since the first expr is not forced

; cy
; (p1 1) => (1 2)
; (p2 1) -> (1 2)
; since the arguments are forced, x is set

; c
; doesn't have any effect since display is always forced

; d 
; I think cy's approach makes the behavior more expected
; you don't need to know whether something will inheritly get forced or not
; the expression will always be forced so easier to predict behavior
; obviously we lose the aspect of laziness by doing so