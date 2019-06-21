(define (a-pythagorean-triple n)
    (let ((i (an-integer-starting-from n)))
        (let ((j (an-integer-starting-from i)))
            (let ((k (an-integer-starting-from j)))
                (require (= (+ (* i i) (* j j)) (* k k)))
                (list i j k)))))

(define (an-integer-starting-from n)
    (amb n (an-integer-starting-from (+ n 1))))

; my take is we need to constrain the limits otherwise
; we can evaluate infinitely incorrect values
;  we will get sqrt of non triples that aren't integers