; segment is a pair of points

; point that make up lines
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

; line segments
(define (make-segment a b) (cons a b))
(define (start-segment s) (car s))
(define (end-segment s) (cdr  s))

(define (print-segment s)
    (newline)
    (display "(")
    (display (start-segment s))
    (display ",")
    (display (end-segment s))
    (display ")"))


; midpoint segment

(define (mid-point s)
    (let ((start-point (start-segment s))
          (end-point (end-segment s)))
    (make-point (/ (+ (x-point start-point) (x-point end-point)) 2)
                (/ (+ (y-point start-point) (y-point end-point)) 2))))

(mid-point (make-segment (make-point -3 5) (make-point 8 -1)))
(mid-point (make-segment (make-point -1 2) (make-point 3 -6)))
(mid-point (make-segment (make-point 6.4 3) (make-point -10.7 4)))
    