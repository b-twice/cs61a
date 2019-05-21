(define (transfer from-account to-account amount)
    ((from-account 'withdraw) amount)
    ((to-account 'deposit) amount))

(define (exchange account1 account2)
    (let ((difference (- (account1 'balance)
            (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))

; transfer does not suffer the same problem as exchange 
; because a calculated value based on the state of both accounts
; is not used in the withdraw/deposit transactions
; that calculated value may change during the process
