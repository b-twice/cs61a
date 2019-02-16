(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (error "No method for these types: APPLY-GENERIC"
                (list op type-tags))))))


(define (name rec) (car rec))
(define (emp rec) (cdr rec))
(define (make-record n r) (cons n r))
(define (tag rec) (attach-tag 'accounting rec))
; a record is 
(put 'name '(accounting) name)
(put 'make-record <division> (lambda (f) (tag f)))

(put 'find-employee-record '(accounting) (filter (lambda (file) (eq? (name (get-record record) n)) files)))


(define (file rec) (car rec))
(define (salaray rec) (car rec))
(put 'get-record '(accounting) file)
(put 'get-record '(business) file)
(put 'get-salary '(business) salary)

(define (find-employee-record files name) (apply-generic 'find-employee-record files name))
(define (get-record file) (apply-generic 'get-record file))
(define (get-salary record) (apply-generic 'get-salary record))

(find-employee-records (map get-record files))

; <file> => set(<emp records>)
; <emp record> => set(<address>, <salary>)
;e.g. (list (list 'brian' (list '123 '9999)))


; the new company will need to implement corresponding features for their data structures, files, records