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

; Not coming up with any scenario where the balance needs to be protected 
; It's contained within any the fn scope
; It's only modified by withdraw/deposit
; There is no calculation in retrieving the balance 
; It's a read action
; Even if you ask for a balance in the middle of a transaction, is the current state 
; not accurate?
