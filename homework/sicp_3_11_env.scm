(define (make-account balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                balance)
        "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
    (define (dispatch m)
        (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else
            (error "Unknown request: MAKE-ACCOUNT"
                m))))
    dispatch)

(define acc (make-account 50))
; first make-account is put into the global env
; then acc is added
; which contains a sub env of:
; withdraw, deposit, dispatch, balance
((acc 'deposit) 40)
; 90
; an env dispatch that is subordinat to acc is created
; the env is terminated and a new env, subordinate to
; make-acc is created with the amount 
((acc 'withdraw) 60)
; 30

(define acc2 (make-account 50))
((acc2 'withdraw) 30)