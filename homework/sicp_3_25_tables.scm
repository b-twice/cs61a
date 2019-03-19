;1d
(define (lookup key table)
    (let ((record (assoc key (cdr table))))
        (if record
            (cdr record)
            false)))

(define (insert! key value table)
    (let ((record (assoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
            (cons (cons key value)
                (cdr table))))))

; ;2d
; (define (lookup key-1 key-2 table)
;     (let ((subtable
;         (assoc key-1 (cdr table))))
;         (if subtable
;             (let ((record
;                 (assoc key-2 (cdr subtable))))
;             (if record
;                 (cdr record)
;                 false))
;             false)))

; (define (insert! key-1 key-2 value table)
;     (let ((subtable (assoc key-1 (cdr table))))
;         (if subtable
;             (let ((record (assoc key-2 (cdr subtable))))
;                 (if record
;                     (set-cdr! record value)
;                     (set-cdr! subtable
;                         (cons (cons key-2 value)
;                             (cdr subtable)))))
;             (set-cdr! table
;                 (cons (list key-1
;                     (cons key-2 value))
;                 (cdr table)))))


; generic
(define (lookup keys table)
    (let ((record (assoc (car keys) (cdr table))))
        (if record
            (if (alist? (cdr record)) 
                (lookup (cdr keys) (cdr record))
                (cdr record))
            false)))

(define (insert! keys value table)
        (let ((subtable (assoc (car keys) (cdr table))))
            (if subtable
                ; if no more keys, insert
                (if (null? (cdr keys))
                    (set-cdr! subtable value)
                    ; if more keys, recurse
                    (insert! (cdr keys) value subtable))
                ; key not in table, insert it
                (begin 
                (set-cdr! table
                    (cons (list (car keys)))
                    (cdr table))
                (insert! (cdr keys) value (assoc (car keys) (cdr table)))))))

 (define (empty-table) 
   (list 'head)) 
  
(define t1 (empty-table))
(insert! '(0) 'zero t1)
(insert! '(1) 'oNe t1)
(lookup '(0) t1)
(insert! '(0) 'zeroq t1)
(lookup '(0) t1)
(lookup '(1) t1)
(lookup '(2) t1)

