
; point that make up lines
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (point-distance p1 p2) 
    (sqrt 
        (+ (square (- (x-point p1) (x-point p2))) 
           (square (- (y-point p1) (y-point p2))))))

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



(define (make-rect p1 p2 p3 p4) (cons p1 (cons p2 (cons p3 (cons p4 '())))))
(define (a-point rect) (car rect))
(define (b-point rect) (car (cdr rect)))
(define (c-point rect) (car (cdr (cdr rect))))
(define (d-point rect) (car (cdr (cdr (cdr rect)))))
(define (rec-width rect) (point-distance (a-point rect) (b-point rect)))
(define (rec-height rect) (point-distance (b-point rect) (c-point rect)))
(define (rec-perim rect) (* 2 (+ (rec-width rect) (rec-height rect))))
(define (rec-area rect) (* (rec-width rect) (rec-height rect)))

(define (a) (make-rect (make-point 0 10) (make-point 16 34) (make-point 2 10) (make-point 39 2)))
(a-point (a))
(b-point (a))
(c-point (a))
(d-point (a))
(rec-width (a))
(rec-height (a))
(rec-perim (a))
(rec-area (a))