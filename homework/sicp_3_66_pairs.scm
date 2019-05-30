(define (pairs s t) 
    (cons-stream 
        (list (stream-car s) (stream-car t)) 
        (interleave 
            (stream-map 
                (lambda (x) (list (stream-car s) x)) 
                (stream-cdr t)) 
            (pairs (stream-cdr s) (stream-cdr t)))))


; how many precede (1, 100)
; how many precede (99, 100)
; how many preceed (100, 100)
