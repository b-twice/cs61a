(define (stream-map proc . argstreams)
    (if (stream-null? (car argstreams))
        the-empty-stream
        (cons-stream
            (apply proc (map stream-car argstreams))
            (apply stream-map
                (cons proc (map
                stream-cdr argstreams))))))
(define (mul-streams s1 s2) (stream-map * s1 s2))
(define (add-streams s1 s2) (stream-map + s1 s2))

(define (partial-sums s) (cons-stream (stream-car s) (add-streams (stream-cdr s) (partial-sum s))))
; take the first value of the stream (since it's an existing stream) and recursive
; combine the next value in the stream with the current state of the stream (will take the stream-car)