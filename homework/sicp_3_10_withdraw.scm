(define (make-withdraw balance)
    (lambda (amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                balance)
            "Insufficient funds")))

(define (make-withdraw initial-amount)
    (let ((balance initial-amount))
        (lambda (amount)
            (if (>= balance amount)
            (begin (set! balance (- balance amount))
                balance)
            "Insufficient funds"))))

(define W1 (make-withdraw 100))
(W1 50)
(define W2 (make-withdraw 100))

; in the first instance an env is created  with the balance 100
; whenever lambda is called, a sub env is created and evaluated within the lambda
; then terminated on completion

; in the second instance an env is created for make-withdraw
; then a sub env is created to hold the let or lambda containing the balance
; from there another sub env is created that is evaluated as called and terminated