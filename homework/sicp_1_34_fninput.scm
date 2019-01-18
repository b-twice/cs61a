; will evaluate f(f) => f(2) => 2(2)
; not exactly clear what the book is trying to get that
; other then the behavior of applicative order
(define (f g)
  (g 2))

(f f)