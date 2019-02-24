;1
(define (make-account init-amount)
  (let ((balance init-amount))
    (define (withdraw amount)
      (set! balance (- balance amount)) balance)
    (define (deposit amount)
      (set! balance (+ balance amount)) balance)
    (define (dispatch msg)
      (cond
        ((eq? msg 'withdraw) withdraw)
        ((eq? msg 'deposit) deposit)))
    dispatch))

(define acc (make-account 50))

((acc 'deposit) 40)


;2
(define (make-account init-amount)
  (let ((balance init-amount))
    (define (withdraw amount)
      (set! balance (- balance amount)) balance)
    (define (deposit amount)
      (set! balance (+ balance amount)) balance)
    (define (dispatch msg)
      (cond
        ((eq? msg 'withdraw) withdraw)
        ((eq? msg 'deposit) deposit)
        ((eq? msg 'balance)  balance)
        ((eq? msg 'init-balance)  init-amount)))
    dispatch))

(define acc (make-account 50))
((acc 'deposit) 40)
(acc 'balance)
(acc 'init-balance)



;3
(define (make-account init-amount)
  (let ((balance init-amount) (transactions '()))
    (define (add-transaction method value)
        (append transactions (list (list method value)))
    )
    (define (withdraw amount)
      (begin
        (set! balance (- balance amount)) 
        (set! transactions (add-transaction 'withdraw amount))
        balance))
    (define (deposit amount)
      (begin 
        (set! balance (+ balance amount)) 
        (set! transactions (add-transaction 'deposit amount))
        balance))
    (define (dispatch msg)
      (cond
        ((eq? msg 'withdraw) withdraw)
        ((eq? msg 'deposit) deposit)
        ((eq? msg 'balance)  balance)
        ((eq? msg 'init-balance)  init-amount)
        ((eq? msg 'transactions)  transactions)))
    dispatch))

(define acc (make-account 50))
((acc 'withdraw) 40)
((acc 'withdraw) 5)
((acc 'deposit) 1)
(acc 'transactions)
; (acc 'init-balance)


;4
(define (plus1 var)
        (set! var (+ var 1)) var)
; using sub model would be
;((plus1 5) (set! var (+ 5 1)) 5)
; => 5
(plus1 5)
; actual result is 6 since set is evaluated first which modifies
; the environment

(define (make-adder n)
    (lambda (x) (+ x n)))

(make-adder 3)
; => lambda
((make-adder 3) 5)
; => 8
(define (f x) (make-adder 3))
(f 5)
; => lambda
(define g (make-adder 3))
; => lambda
(g 5)
; => 8
(define (make-funny-adder n)
        (lambda (x)
            (if (equal? x 'new)
                (set! n (+ n 1))
                (+ x n))))
(define h (make-funny-adder 3))
(define j (make-funny-adder 7))

(h 5)
; 8
(h 5)
; 8

(h 'new)
(h 5)
; 9
(j 5)
; 12

(let ((a 3)) (+ 5 a))
; 8
((let ((a 3)) (lambda (x) (+ x a))) 5)
; 8

((lambda (x) (let ((a 3)) (+ x a))) 5)
; 8

(define k (let ((a 3)) (lambda (x) (+ x a))))

(k 5)
; 8

(define p 
    (let ((a 3)) 
        (lambda (x)
        (if (equal? x 'new)
            (set! a  (+ a 1))
            (+ x a)
        ))
    ))

(p 5)
; 8
(p 5)
; 8
(p 'new)
; 8
(p 5)
; 9

(define r
    (lambda (x)
        (let ((a 3))
            (if (equal? x 'new)
                (set! a (+ a 1))
                (+ x a)))))

(r 5)
(r 5)
(r 'new)
(r 5)
;8

(define s
    (let ((a 3))
        (lambda (msg)
            (cond ((equal? msg 'new)
                (lambda ()
                    (set! a (+ a 1))))
                ((equal? msg 'add) (lambda (x) (+ x a)))
                (else (error "huh?"))))))

(s 'add)
; lambda
(s 'add 5)
;error
((s 'add)  5)
; 8
(s 'new)
; lambda
((s 'add) 5)
; 8
((s 'new))
; 4
((s 'add) 5)
; 9

(define (ask obj msg . args)
    (apply (obj msg) args))

(ask s 'add 5)
; 9
(ask s 'new)
; woops applies empty args to lambda
(ask s 'add 5)
; 10
(define x 5)

(let ((x 10)
    (f (lambda (y) (+ x y))))
    (f 7))
; 12
; the lambda takes the globa, the let x is not in the same scope
(define x 5)