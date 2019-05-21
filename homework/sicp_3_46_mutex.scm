(define (make-mutex)
    (let ((cell (list false)))
        (define (the-mutex m)
            (cond ((eq? m 'acquire)
            (if (test-and-set! cell)
                (the-mutex 'acquire))); retry
            ((eq? m 'release) (clear! cell))))
        the-mutex))
(define (clear! cell) (set-car! cell false))

(define (test-and-set! cell)
    (if (car cell) true (begin (set-car! cell true) false)))
    
; a mutex is an object that supports two operations, acquiredor released

; mutex [false]
; p1 -> the-mutex 'acquire -> true -> the-mutex 'release
; p2 -> the-mutex 'acquire -> true -> ..... -> the-mutex 'release
; the releases will occur at different times, opening up a fault in the span
; between the release of the first and the second 
