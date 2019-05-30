(define (display-line x)
  (newline)
(display x))


(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
    (stream-enumerate-interval (+ low 1) high))))

(define (display-stream s)
(stream-for-each display-line s))

(define sum 0)

(define (accum x) (set! sum (+ x sum)) sum)

(define seq
    (stream-map accum
    (stream-enumerate-interval 1 20)))
;  sequence => (1 3 6 10 15 21 28 36 45 55 66 78 91 105 120 136 153 171 190 210)

(define y (stream-filter even? seq))

(define z
    (stream-filter (lambda (x) (= (remainder x 5) 0))
    seq))

; sum is 1 when seq executed
; when y is eecuted, the stream is on 6
(stream-ref y 7)
; 136 is the 7th even value from 6
(display-stream z)
; the stream is consumed sum is 210

; What is the value of sum afer each of the above expressions
; is evaluated? What is the printed response to evaluating
; the stream-ref and display-stream expressions? Would
; these responses differ if we had implemented (delay ⟨ exp ⟩ )
; simply as (lambda () ⟨ exp ⟩ ) without using the optimiza-
; tion provided by memo-proc ? Explain.
; without optimization the sum would be set everytime the accum proc is called