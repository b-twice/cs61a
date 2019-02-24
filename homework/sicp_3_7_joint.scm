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


(define (make-joint acc pw newpw)
        (define (dispatch secret m)
            (cond 
                ((not (eq? secret newpw))
                    (lambda (amount) (error "Incorrect password")))
                (else (acc pw m)))
        ) 
    dispatch)


(define peter-acc (make-account 100 'open-sesame))
(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

((paul-acc 'rosebud 'deposit) 51)

