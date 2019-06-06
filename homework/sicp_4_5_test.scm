(cond ((assoc 'b '((a 1 ) (b 2))) => cadr) (else false))


; if the 
(let ((v (assoc 'b '((a 1 ) (b 2)))))
    (if (not (eq? false v) (cadr v) 

    if ())
(if () (cadr (assoc 'b '((a 1 ) (b 2))))

;; derived expressions

(define (cond? exp) (tagged-list? exp 'cond))

(define (cond-clauses exp) (cdr exp))

(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))

(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))
(define (cond-actions-=> clause) (cadr clause))

(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))

(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

(define (expand-clauses clauses)
  (if (null? clauses)
      'false
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last -- COND->IF"
                       clauses))
            ; need to update the make-if
            (if ('eq '=> (cadr (cond-actions-=> first)))
                (make-if (cond-predicate first)
                        (cons (cadr (cons-actions-first) (cond-predicate-first))
                        
                        (expand-clauses rest))))))
            (make-if (cond-predicate first)
                     (sequence->exp (cond-actions first))
                     (expand-clauses rest))))))

