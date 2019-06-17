(define (factorial n) 
    (unless (= n 1) 
    (* n (factorial (- n 1))) 
    1))

; It will not work in applicative order, because the argument expressions to unless will be evaluated
; before the bases case of (= n 1)
; Using normal order, however, will allow factorial to work as expected as the expressions are delayed
; until unless is applied

