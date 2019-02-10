(define (make-vect x y) (list x y))
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cadr vect))

(define (make-segment v1 v2) (list v1 v2))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cadr segment))


(define (segments->painter segment-list)
    (lambda (frame)
        (for-each
        (lambda (segment)
            (draw-line
                ((frame-coord-map frame)
                    (start-segment segment))
                ((frame-coord-map frame)
                    (end-segment segment))))
        segment-list)))


(define outline-segments
 (list
  (make-segment
   (make-vect 0.0 0.0)
   (make-vect 0.0 0.99))
  (make-segment
   (make-vect 0.0 0.0)
   (make-vect 0.99 0.0))
  (make-segment
   (make-vect 0.99 0.0)
   (make-vect 0.99 0.99))
  (make-segment
   (make-vect 0.0 0.99)
   (make-vect 0.99 0.99))))