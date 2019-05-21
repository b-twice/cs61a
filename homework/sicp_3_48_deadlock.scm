
(define (exchange account1 account2)
    (let ((difference (- (account1 'balance)
                    (account2 'balance))))
        ((account1 'withdraw) difference)
        ((account2 'deposit) difference)))

;  this avoids the deadlock problem because the 
; smallest account is always serialized first
; this guarantees that the smallest account will always be accessed first
(define (serialized-exchange account1 account2)
    (let ((serializer1 (account1 'serializer))
            (serializer2 (account2 'serializer)))
        (if (< (account1 'account-id) (account2 'account-id'))
        ; always initiate the smallest serializer first
            ((serializer2 (serializer1 exchange))
                account1
                account2)
            ((serializer1 (serializer2 exchange))
                account1
                account2)
        )))

(define (make-account-and-serializer balance account-id)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount)) balance)
            "Insufficient funds"))
        (define (deposit amount)
            (set! balance (+ balance amount)) balance)
    (let ((balance-serializer (make-serializer))
        (define (dispatch m)
        (cond ((eq? m 'withdraw) (balance-serializer withdraw))
            ((eq? m 'deposit) (balance-serializer deposit))
            ((eq? m 'balance) balance)
            ((eq? m 'account-id) account-id)
            ((eq? m 'serializer) balance-serializer)
            (else (error "Unknown request: MAKE-ACCOUNT" m))))
        dispatch))