(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(paint einstein)

; (define (right-split painter n)
;     (if (= n 0)
;         painter
;         (let ((smaller (right-split painter (- n 1))))
;             (beside painter (below smaller smaller)))))

; (define (up-split painter n)
;     (if (= n 0)
;         painter
;         (let ((smaller (up-split painter (- n 1))))
;             (below painter (beside smaller smaller)))))

; (define (split op1 op2)
;     (lambda (painter n)
;         (if (= n 0)
;             painter
;             (let ((smaller ((split op1 op2) painter (- n 1))))
;                 (op1 painter (op2 smaller smaller))))))
