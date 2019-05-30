(define (stream-limit s tolerance)
    (cond 
        ((stream-null? s) the-empty-stream)
        ((stream-null? (stream-cdr stream)) (stream-car stream)) ; nothing left
        ((> tolerance (abs (- (stream-car s) (stream-car (stream-cdr s))))) (stream-car (stream-cdr s))) ; values within tolerance
        (stream-limit (stream-cdr s) tolerance)))  ; move on

(define (sqrt x tolerance) (stream-limit (sqrt-stream x) tolerance))
