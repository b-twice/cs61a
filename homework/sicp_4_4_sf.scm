
(define (and? exp) (tagged-list? exp 'and))
(define (rest-p exp) (cdr exp))
(define (first-p exp) (cadr exp))
(define (last-p? exp) (null? (cddr exp)))



(define (eval-and exps env)
    (if (last-p? exps)
        #t
        (let (first (eval (first-p exps) env))
            (if (false? first) #f
                (eval-and (rest-p exps) env)))))
(define (eval-or)
    (if (last-p? exps)
        #f
        (let (first (eval (first-p exps) env))
            (if (true? first) #t
                (eval-and (rest-p exps) env))))
)

;; Conditionals

(define (eval-if exp env)
  (if (true? (eval (if-predicate exp) env))
      (eval (if-consequent exp) env)
      (eval (if-alternative exp) env)))

;; Sequences

(define (eval-sequence exps env)
  (cond ((last-exp? exps) (eval (first-exp exps) env))
        (else (eval (first-exp exps) env)
              (eval-sequence (rest-exps exps) env))))

;; Assignments and definitions

(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
                       (eval (assignment-value exp) env)
                       env)
  'ok)

(define (eval-definition exp env)
  (define-variable! (definition-variable exp)
                    (eval (definition-value exp) env)
                    env)
  'ok)

;

(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (let (right (list-of-values (rest-operands exps) env))
            (let (left (eval (first-operands exp) env))
                (cons left right)))))

