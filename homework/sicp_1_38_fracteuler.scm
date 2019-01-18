
(define (cont-frac n d k)
(define (frac i)
   (if (< i k)
       (/ (n i) (+ (d i) (frac (+ i 1))))
       (/ (n i) (d i))))
(frac 1))

(define (d i) 
    (if (= 0 (remainder (+ i 1)  3)) (* 2 (/ (+ i 1) 3))
    1))

    

; indices where the value is true
; 2 5 8 11 
; result
; 2 4 6 8
; as the index increasese by 3 the result goes up by 2
; 4 = 2 * ((5 + 1)) / 3)

(d 1) 
;1
(d 2)
;2
(d 3)
;1
(d 4)
;1
(d 5)
;4
(d 6)
;1
(d 7)
;1
(d 8)
;6
(d 9)
;1
(d 10)
;1
(d 11)
;8

(+ 2 (cont-frac (lambda (i) 1.0)
           d
          8))

(+ 2 (cont-frac (lambda (i) 1.0)
           d
          9))

(+ 2 (cont-frac (lambda (i) 1.0)
           d
          10))

