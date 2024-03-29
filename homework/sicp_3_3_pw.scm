(define (make-account balance pw)
    (define attempts 0)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)

    (define (call-the-cops amount) "Calling the cops")
    (define (dispatch secret m)
        (cond 
            ((> attempts 7) call-the-cops)
            ((not (eq? secret pw))
                (begin (set! attempts (+ 1 attempts))
                (lambda (amount) (error "Incorrect password"))))
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request: MAKE-ACCOUNT"
                m))))
    dispatch)

(define acc (make-account 100 'secret-password))
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)
((acc 'some-other-password 'deposit) 51)