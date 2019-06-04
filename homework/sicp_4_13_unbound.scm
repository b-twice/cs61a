(define (make-unbound! var env)
    (define (env-loop env)
        (define scan (frame))
            (cond ((null? frame) (env-loop (enclosing-environment env)))
            ; after var found stop scanning an exit
            ((eq? (caar frame) var) (delete var frame))
            (else (scan (cdr frame)))
        (if (eq? env the-empty-environment)
            (error "Unbound variable: SET!" var)
        (let ((frame (first-frame env)))
            (scan (frame)))))
    (env-loop env))


; design is to delete the first binding of the var found in a frame
; should bubble up frames, if the var is a valid binding, then it
; should be removable