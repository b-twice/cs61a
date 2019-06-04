(define (eval exp env)
    (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ; ((quoted? exp) (text-of-quotation exp))
        ; ((assignment? exp) (eval-assignment exp env))
        ; ((definition? exp) (eval-definition exp env))
        ; ((if? exp) (eval-if exp env))
        ; ((lambda? exp) (make-procedure (lambda-parameters exp)
        ; (lambda-bo
        ; ((begin? exp)
        ;     (eval-sequence (begin-actions exp) env))
        ; ((cond? exp) (eval (cond->if exp) env))
        ; these are all the special forms
        ((get 'eval-op (car exp)) ((get 'eval-op (car exp)) exp env))
        ((application? exp)
            (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
            (error "Unknown expression type: EVAL" exp))))


(define eval-table (make-table))
(define get-eval (syntax-table 'lookup-proc))
(define put-eval (syntax-table 'insert-proc))

(define put 'eval-op 'if eval-if)



(define (eval-if exp env)
    (if (true? (eval (if-predicate exp) env))
        (eval (if-consequent exp) env)
        (eval (if-alternative exp) env)))

(define (deriv exp var)
    (cond 
        ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
            (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))