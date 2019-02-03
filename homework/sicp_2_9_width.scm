(define (make-interval a b) (cons a b))

(define (upper-bound i) (car i))

(define (lower-bound i) (cdr i))

(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
    (+ (upper-bound x) (upper-bound y))))


(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                    (max p1 p2 p3 p4))))

(define (div-interval x y)
    (mul-interval
    x
    (make-interval (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y)))))


(define (sub-interval x y)
    (make-interval (- (lower-bound x) (upper-bound y))
    (- (upper-bound x) (lower-bound y))))

(define (width-interval fn)
    (lambda (a b) (/ (- (upper-bound (fn x y)) (lower-bound (fn x y))) 2)))
        

; width is half of the difference between its upper and lower
; measurement of uncertainty of the number specified by the interval
;

(add-interval (make-interval 0 10) (make-interval 0 2))
(mul-interval (make-interval 0 10) (make-interval 0 2))
((width-interval add-interval) (make-interval 0 10) (make-interval 0 2))
((width-interval mul-interval) (make-interval 0 10) (make-interval 0 2))