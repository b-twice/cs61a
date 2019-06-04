(define (cond? exp) (tagged-list? exp 'cond))
(define (cond-clauses exp) (cdr exp))
(define (cond-else-clause? clause)
        (eq? (cond-predicate clause) 'else))
(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))
(define (cond->if exp) (expand-clauses (cond-clauses exp)))
(define (expand-clauses clauses)
    (if (null? clauses) 
        'false ; no else clause
    (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last: COND->IF"
                clauses))
            (make-if (cond-predicate first)
                (sequence->exp (cond-actions first))
                (expand-clauses rest))))))


(let  ( (var1 exp) (var2 exp)) ())

; wrapping the body in a lambd and passing expressions in
((lambda (var1 var2) ()) (exp) (exp)) 

    (define (make-lambda parameters body)
(cons 'lambda (cons parameters body)))



(define (let? exp) (tagged-list exp 'let))
(define (let-base exp) (cdr exp) )
(define (let-definitions exp) (car exp) )
(define (let-action exp) (cadr exp) )
(define (let-definition-variable def) (car def))
(define (let-definition-body def) (cdr def))



(define (let->combination exp) (expand-combination (let-base exp)))
(define (expand-combination base) 
       (let (definitions (let-definitions base))
             (body (let-definition-body base)))
        (cons (make-lambda (map let-definition-variable definitions) body) (map let-action definitions)
        
