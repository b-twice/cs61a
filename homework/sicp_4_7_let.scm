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
        

(let* ((x 3) (y (+ x 2)) (z (+ x y 5))) (* x z))


(lambda (x) (
    (lambda (y) 
        (lambda (z)
            (* x z)
        )(+ x y 5)
    )(+ x 2) 
)(3)


(define (let*->nested-lets exp) (expand-lets (cadr exp) (cddr exp)

(define (expand-lets exp body) (
    (if null? (cdr exp)) (cons (make-lambda (caar exp) (cadar exp)) body)
    (cons (make-lambda (caar exp) (cadar exp)) (expand-lets (cdr exp) body)) 

))
