

; (define (apply-generic op . args)
;     (let ((type-tags (map type-tag args)))
;         (let ((proc (get op type-tags)))
;             (if proc
;                 (apply proc (map contents args))
;                 (error "No method for these types: APPLY-GENERIC"
;                 (list op type-tags))))))

(define (make-from-real-imag x y)
    (define (dispatch op)
        (cond ((eq? op 'real-part) x)
            ((eq? op 'imag-part) y)
            ((eq? op 'magnitude) (sqrt (+ (square x) (square y))))
            ((eq? op 'angle) (atan y x))
            (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op))))
        dispatch)


(define (make-from-mang-ang r a)
    (define (dispatch op)
        (cond ((eq? op 'real-part) (* r (cos a)))
            ((eq? op 'imag-part) (* r (sin a)))
            ((eq? op 'magnitude) r)
            ((eq? op 'angle) a)
            (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op))))
        dispatch)

(define (apply-generic op arg) (arg op))