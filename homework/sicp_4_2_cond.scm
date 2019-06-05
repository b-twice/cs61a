(define (eval exp env)
    (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((application? exp)
            (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp) (make-procedure (lambda-parameters exp)
            (lambda-body exp)
            env))
        ((begin? exp)
            (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        ; ((application? exp)
        ;     (apply (eval (operator exp) env)
        ;         (list-of-values (operands exp) env)))
        (else
            (error "Unknown expression type: EVAL" exp))))

(define (assignment? exp) (tagged-list? exp 'set!))
(define (assignment-variable exp) (cadr exp))
(define (assignment-value exp) (caddr exp))

; (define x 3)
; eval will treate define as a procedure, not a definition
; and attempt to apply x 3 to define

; (define (application? exp) (pair? exp))
(define (application? exp) 
    (tagged-list? exp 'call))
; we now need to check every procedure call
; to verify it is an application, not definition
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))
(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))

