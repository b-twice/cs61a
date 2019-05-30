(define (stream-map proc s)
    (if (stream-null? s)
        the-empty-stream
        (cons-stream (proc (stream-car s))
            (stream-map proc (stream-cdr s)))))

(define (stream-map proc . argstreams)
    (if (stream-null? (car argstreams))
        the-empty-stream
        (cons-stream
            (apply proc (map stream-car argstreams))
            (apply stream-map
                (cons proc (map
                stream-cdr argstreams))))))


(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
    (stream-enumerate-interval (+ low 1) high))))

(stream-map + (stream-enumerate-interval 1 3) (stream-enumerate-interval 40 43) (stream-enumerate-interval 700 703))