
; (define f 
;     (let ((value #f))
;         (lambda (v)
;             (if (eq? #f value) (begin (set! value v) v) value)
;         )
;     )
; )

(define f
  (let ((s -1))
    (lambda (x)
      (if (= s -1)
          (begin (set! s x)
                 s)
           s))))

(+ (f 0) (f 1))