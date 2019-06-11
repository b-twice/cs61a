1. 

a.
(let ((x (list 1 2 3)))
    (set-car! x (list ’a ’b ’c))
    (set-car! (cdar x) ’d)
    x)

(1 2 3)
((a b c) 2 3)
((a b c) 2 3)
((a d c) 2 3)
#CORRECT

b.
(define x 3)
(define m (list x 4 5))
(set! x 6)
m
(3 4 5)
#CORRECT


c.
(define x (list 1 ’(2 3) 4))
(define y (cdr x))
(set-car! y 5)
x

x=> (1 (2 3) 4)
y => ((2 3) 4)
(1 5 4)
#CORRECT


(let ((x (list 1 2 3)))
(set-cdr! (cdr x) x)
x)
(1 2 3)
=> endless loop
#CORRECT



2.
the first one
#CORRECT

3.
(define x 4)
(define (baz x)
    (define (* a b) (+ a b)) 
    (lambda (y) (* x y)))
(define foo (baz (* 3 10)))
(foo (* 2 x))

(foo 8)
((baz 30) 8)
38
#CORRECT

4. lists


<!-- 
change list by mutation
assume args are even umber of elements
result requires exactly as many pairs as the argument
work by rearranging the pairs, do not create new pairs
 -->
(define (make-alist! lst)
  (if (null? lst)
      'done
      (let ((car1 (car lst))
	    (cdr1 (cdr lst))
	    (car2 (cadr lst))
	    (cdr2 (cddr lst)))
	(set-car! lst cdr1)
	(set-cdr! lst cdr2)
	(set-car! cdr1 car1)
	(set-cdr! cdr1 car2)
	(make-alist! cdr2)))
  lst)

5. vectors
> (histogram (vector 3 2 2 3 2))
(0 0 3 2) ;; no students got 0 points, no students got 1 point,
;; 3 students got 2 points, and 2 students got 3 points.
> (histogram (vector 0 1 0 2))
(2 1 1) ;; 2 students got 0 points, 1 student got 1 point,
;; and 1 student got 2 points.

(define (histogram scores) 
    (define (count-scores results idx) 
        (let ((pos (vector-ref scores idx)))
        (begin 
        (vector-set! results  pos (+ (vector-ref results pos) 1))
        (if (eq? idx 0) results
        (count-scores results (- idx 1))))))
    (count-scores (make-vector (+ (max-vector scores) 1) 0) (- (vector-length scores) 1)))
#CORRECT

6. Concurrency

a. deadlock
#CORRECT
b. inefficiency
#CORRECT
c. correct parallelism
#CORRECT

7.
In weaving, a horizontal thread is pulled through a bunch of vertical threads. 
The hori-zontal thread passes over some of the vertical ones, and under others. 
The choice of overor under determines the pattern of the weave.
We will represent a pattern as a list of the wordsOVERandUNDER, repeated as needed.

Here’s an example:
(OVER OVER UNDER OVER UNDER UNDER)
The pattern may be of any length (it depends on the desired width of the woven cloth),but it must contain at least oneOVERand at least oneUNDER.
Write a Scheme expression to compute the (infinite) stream ofall possible patterns

<!-- I didn't understand what the question was asking for but on looking at the answer it makes sense -->
<!-- I forgot about interlave and the recursive way in which we are picking out recursively from streams -->
<!-- while ensuring that each stream has values of over and under -->

(define foo
  (cons-stream '()
               (interleave (stream-map (lambda (p) (cons 'over p)) foo)
                           (stream-map (lambda (p) (cons 'under p)) foo))))

(define patterns
  (stream-filter (lambda (p) (and (member 'over p) (member 'under p)))
                 foo))