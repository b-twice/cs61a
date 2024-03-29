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
(define integers (cons-stream 1 (add-streams ones integers))) 
(define factorials (cons-stream 1 (mul-streams factorials integers)))
; 1
; 1 * 2
; 2 * 3
; 6 * 4
;  ....