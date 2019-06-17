; Exercise 4.28: eval uses actual-value 
; rather than eval to evaluate the operator 
; before passing it to apply, in 
; order to force the value of the operator.
; Give an example that demonstrates the need for this forcing.

; needed for nested thunks or higher-order procedures with delayed expressions
; (define (a x) (+ x 1)) 
; (define (f a x) (a x)) 
; a will be treated as a thunk and can't be used as a (a 9)