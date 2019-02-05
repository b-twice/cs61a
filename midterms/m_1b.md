# 1
(every (bf x) ’(ab cd ef gh))
<!-- error -->

(cond (’hello 5) (#t 6) (else 7))
<!-- 5 -->

(let ((x 10)
(y (+ x 2)) )
(* y 3))

<!-- error  -->
<!-- can't reference another let var in y -->

(cons (list ’() ’(b)) (append ’(c) ’(d)))
<!-- cons (() (b)) (c d))-->
<!-- ((() (b)) c d) -->

((lambda (x) (cons x x)) ’(a))
<!-- ((a) . (a)) -->

(cdar ’((1 2) (3 4)))
<!-- (2) -->

# 2
<!-- false -->
<!-- true -->
<!-- true -->
<!-- false -->

# 3
<!-- 'done -->
<!-- error -->

<!-- 'done  -->
<!-- 'done  -->


#4
(define (every-nth n sentence)
    (define (nth? count) (if (equal? (modulus count n) 0) #t #f))
    (define process s count)
        (cond ((empty? s) '()) 
              ((nth? count)  (pse (first s) (process (bf s) (+ count 1))))
        (else (se (process (bf s) (+ count 1))))
    (process sentence 1))


#5

(define (pairmap fn sent)
    (if (empty? (bf sent))
        '()
        (se (fn (first sent (first (bf sent))))
            (pairmap fn (bf sent)))))

(define (differences sent) (pairmap - sent))
(define (wordpairs sent) (pairmap word sent))

#6
(define (colors sockdrawer)
    (define (remdup seq)
    (cond ((null? seq) ’())
        ((memq (car seq) (cdr seq)) (remdup (cdr seq)))
        (else (cons (car seq) (remdup (cdr seq)))) ))
    (remdup sockdrawer) )

(define (howmany color sockdrawer)
    (length (filter (lambda (sock) (eq? sock color)) sockdrawer)) )

(define (odd-sock? sockdrawer)
    (if 
        (> length (filter (lambda (color) (odd? (howmany color sockdrawer))) (colors sockdrawer)) 0)
            #t 
            #f))

(define (howmany color sockdraw)
    (length cadr sockdrawer)) 

(define (colors sockdrawer)
    (map car sockdrawer)) 
