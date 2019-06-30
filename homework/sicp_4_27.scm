(define count 0)
(define (id x) (set! count (+ count 1)) x)

(define w (id (id 10)))
;;; L-Eval input:
count
;;; L-Eval value:
0
; nothing has been evaluated yet for w
; this is actually 1 the id gets evaluated and returns a thunk
;;; L-Eval input:
w
;;; L-Eval value:
10
; id returns the value passed in, which is 10
;;; L-Eval input:
count
;;; L-Eval value:
2