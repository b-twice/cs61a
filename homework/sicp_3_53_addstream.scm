(define (stream-map proc . argstreams)
    (if (stream-null? (car argstreams))
        the-empty-stream
        (cons-stream
            (apply proc (map stream-car argstreams))
            (apply stream-map
                (cons proc (map
                stream-cdr argstreams))))))
(define (add-streams s1 s2) (stream-map + s1 s2))
(define s (cons-stream 1 (add-streams s s)))
; cons-stream is a stream with the promise
; to add the next values to eachother
; the first element is one
; the second element is 1 + 1
; the third element is 2 + 2
; the fourth element is 4 + 4
; produces the power of 2 or double the previous value




