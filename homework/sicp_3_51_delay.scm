(define (display-line x)
  (newline)
(display x))

(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
    (stream-enumerate-interval (+ low 1) high))))

; (define (stream-map proc . argstreams)
;     (if (stream-null? (car argstreams))
;         the-empty-stream
;         (cons-stream
;             (apply proc (map stream-car argstreams))
;             (apply stream-map
;                 (cons proc (map
;                 stream-cdr argstreams))))))

(define (show y) (display-line y) y)

(define x (stream-map show (stream-enumerate-interval 0 10)))

(stream-ref x 5) 
; 0 1 2 3 4 5 
; err => 1 2 3 4 5
; this is because 0 is already evaluated when x is loaded
(stream-ref x 7)
; 6 7