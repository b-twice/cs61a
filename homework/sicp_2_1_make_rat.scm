; procs from book
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (equal-rat? x y)
    (= (* (numer x) (denom y))
    (* (numer y) (denom x))))

(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
    (* (numer y) (denom x)))
    (* (denom x) (denom y))))
(define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y))
    (* (numer y) (denom x)))
    (* (denom x) (denom y))))
(define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
    (* (denom x) (denom y))))
(define (div-rat x y)
    (make-rat (* (numer x) (denom y))
    (* (denom x) (numer y))))

(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))  

; better make-rat with gcd and handle negative
(define (make-rat n d)
    (let ((g (gcd n d)))
    (if (< (* n d) 0) (cons (/ (* n -1) g) (/ (abs d) (abs g)))
    (cons (/ n g) (/ d g)))))


(print-rat (make-rat 1 2))
(print-rat (make-rat -1 -2))
(print-rat (make-rat 1 -2))
(print-rat (make-rat -1 2))