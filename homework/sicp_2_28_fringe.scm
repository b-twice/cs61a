
; (define (fringe tree)
;     (if (list? l) 
;         (append (map (lambda (el) (deep-reverse el)) ))
;         l))

(define (count-leaves x)
    (cond ((null? x) 0)
          ((not (pair? x)) 1)
          (else (+ (count-leaves (car x))
                (count-leaves (cdr x))))))

; (define (fringe x)
;     (cond ((null? x) x)
;           ((not (list? x)) x)
;           (else (append (fringe (car x))
;                 (fringe (cdr x))))))

(define (fringe tree)
    (define (find x res)
        (cond ((null? x) '())
            ((not (pair? x)) (list x))
            (else (append (find (car x) res)
                    (find (cdr x) res)))))
    (find tree '()))

(define (fringe tree)
    (cond ((null? tree) '())
          ((not (pair? tree)) (list tree))
          (else (append (fringe (car tree))
            (fringe (cdr tree))))))


(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))