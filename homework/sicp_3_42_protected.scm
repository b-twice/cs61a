(define (make-account balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance
                    (- balance amount))
                balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
    (let ((protected (make-serializer)))
        ; Ben's idea is to protected here and not protect on each invocation of 
        ; dispatch
        (let ((protected-withdraw (protected withdraw))
        (protected-deposit (protected deposit)))

        (define (dispatch m)
            (cond ((eq? m 'withdraw) (protected withdraw))
                ((eq? m 'deposit) (protected deposit))
                ((eq? m 'balance)
                    ((protected
                        (lambda () balance)))) ; serialized
                    (else
                        (error "Unknown request: MAKE-ACCOUNT"
                            m))))
            dispatch))

; The difference is you are invoking the same serialized set of fns
; or creating new serialized functions on each dispatch 
; could a failure cause a freeze? If the fns are generated each dispatch
; then they are fresh, isolated serailized funcitons?

; online, accordingly, there is no difference since serialization has effect until 
; the invocation, serializing every time or once has no impact as the inovcation
; is the key part to concurrent handling