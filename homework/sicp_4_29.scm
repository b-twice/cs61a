(define count 0)
(define (id x) (set! count (+ count 1)) x)

(define (square x) (* x x))
;;; L-Eval input:
(square (id 10))
;;; L-Eval value:
; memoize = 100
; not = 100
;;; L-Eval input:
count
;;; L-Eval value:
; memoize = 1
; not = 2
