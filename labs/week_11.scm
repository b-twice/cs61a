1. What is the type of the value of(delay (+ 1 27))?What is the type of the value of(force (delay(+ 1 27)))?
; A fn promising the evaluation of +1 27. Force delay is the result of (+ 1 27)

2. Evaluation of the expression (stream-cdr (stream-cdr (cons-stream 1 '(2 3)))
; cons-stream returns a stream with '(2 3) as a promise, stream-cdr evaluates the promise
; since there is nothing left in the stream, the second stream-cdr fails

3. 
(define (enumerate-interval low high)
    (if (> low high)
        '()
        (cons low (enumerate-interval (+ low 1) high))))
        
(define (stream-enumerate-interval low high)
    (if (> low high)
        the-empty-stream
        (cons-stream low (stream-enumerate-interval (+ low 1) high))))


(delay (enumerate-interval 1 3))
(stream-enumerate-interval 1 3)

; the first delays the whole calcuation while the second evaluates the first element


4.

2*7/2 = 7
3*7+1 = 22
22/2 = 11
11*3 + 1 = 34
34/2 = 17
17*3 + 1 = 52
52 / 2 = 26
26 / 2 = 13
13 * 3 + 1 = 40
40/2 = 20
20 / 2 = 10
10 /2 = 5
5*3 + 1 = 15


(define (num-seq n)
    (define (process s)
        (if (odd? s) (cons-stream s (process (+ (* s 3) 1)))
        (cons-stream s (process (/ s 2)))))
    (process n))

(define (seq-length str)
    (if (= (car str) 1) 1
        (+ 1 (seq-length (stream-cdr str)))))


(define (stream-section n stream)
  (cond ((= n 0) '())
        (else 
          (cons 
            (head stream)
            (stream-section 
             (- n 1)
             (tail stream))))))
