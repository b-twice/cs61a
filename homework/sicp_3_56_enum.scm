; combine two orderd streams into one, elimination repetitions
(define (merge s1 s2) 
    (cond ((stream-null? s1) s2) 
    ((stream-null? s2) s1) 
    (else 
        (let ((s1car (stream-car s1)) 
            (s2car (stream-car s2))) 
        ; if the first is less, keep it and go next
        (cond ((< s1car s2car) 
            (cons-stream 
                s1car 
                (merge (stream-cdr s1) s2))) 
            ; if the second is more, keep it and go next
            ((> s1car s2car) 
                (cons-stream 
                s2car 
                (merge s1 (stream-cdr s2)))) 
            ; if the same, keep the first and go next on both
            (else 
                (cons-stream 
                    s1car 
                    (merge (stream-cdr s1) 
                        (stream-cdr s2)))))))))

(define (scale-stream stream factor) (stream-map (lambda (x) (* x factor)) stream)) 

(define S (cons-stream 1 (merge (scale-stream S 2) (merge (scale-stream S 3) (scale-stream S 5)))) )

; combine the merge of 2 with the results of 3 and 5

