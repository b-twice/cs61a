(define (an-element-of items)
    (require (not (null? items)))
    (amb (car items) (an-element-of (cdr items))))

(define (prime-sum-pair list1 list2)
    (let ((a (an-element-of list1))
            (b (an-element-of list2)))
        (require (prime? (+ a b)))
        (list a b)))


(define (a-pythagorean-triple-between low high)
    (let ((i (an-integer-between low high)))
        (let ((j (an-integer-between i high)))
            (let ((k (an-integer-between j high)))
                (require (= (+ (* i i) (* j j)) (* k k)))
                (list i j k)))))

(define (an-integer-between low high)
    (require (not (> low high)))
    (amb low (an-integer-between (+ n 1) high)))

(define (an-integer-starting-from n)
    (amb n (an-integer-starting-from (+ n 1))))