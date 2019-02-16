
; given definition of a procedure return information about the parameters of the proc
(define (inferred-types fn) (
    (map (lambda (arg) (eval-exp arg (caddr fn))) (cdr (cadr fn))
))
(define (eval-exp arg body) 
    (list arg (map (lambda (exp) (infer-type arg (find-type exp))) body)))
(define (infer-type arg exp)
    (cond 
        ((quoted? exp) '?)
        ((or (eq? (car exp) arg) (eq? arg exp)) 'procedure)
        ((or (eq? (car exp) arg) (eq? arg exp)) 'procedure)
        ((arithmetic? exp) 'number')
        ((islist? exp) 'list)
        ((sentence? exp) 'sentence-or-word)
        (else x)))
