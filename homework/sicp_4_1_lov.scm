(define (eval exp env)
    (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp) (make-procedure (lambda-parameters exp)
            (lambda-body exp)
            env))
        ((begin? exp)
            (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        ((application? exp)
            (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
            (error "Unknown expression type: EVAL" exp))))

; use nested let to force the evaluation of hte expressions
; before the call to cons
(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (let (left (eval (first-operands exp) env))
            (let (right (list-of-values (rest-operands exps) env))
                (cons left right)))))

(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (let (right (list-of-values (rest-operands exps) env))
            (let (left (eval (first-operands exp) env))
                (cons left right)))))


    ; (cons (eval (first-operand exps) env)
    ;     (list-of-values (rest-operands exps) env))))