; 1
; group each line by the first word, which will then get dispensed into reducer
(mapreduce (lambda (input-key-value-pair)
        (list (first (car input-key-value-pair (list (make-kv-pair ’line 1))))))   ; mapper
    +; reducer
    0; base 
    case"/gutenberg/shakespeare")          ; data

;2a 
; kv pair is the document and value is single line of text
(mapreduce (lambda (input-key-value-pair)
        (map (lambda (w) (cons (w 1))) (cadr input-key-value-pair)))
    +; reducer
    0; base 
    case"/gutenberg/shakespeare")          ; data


; 2b
(mapreduce (lambda (input-key-value-pair)
        (map (lambda (w) (cons (w 1))) (cadr input-key-value-pair)))
    (lambda (current next) (if (> (car current) (car next) current next))); reducer
    0; base 
    case"/gutenberg/shakespeare")          ; data


; 3 
(mapreduce 
    (lambda (kv-pair) (if (match? pattern (kv-value kv-pair)) (list kv-pair) '())))
    cons-stream; reducer
    the-empty-stream; base 
    case"/gutenberg/shakespeare")          ; data


(define (x pattern dir))

; HW

; 1a
(mapreduce 
    (lambda (kv-pair) (map (lambda (w) (cons w (car kv-pair))) (cadr kv-pair))); mapper
    cons; reducer
    '(); base 
    case"/gutenberg/shakespeare")          ; data

; 1b
(mapreduce 
    (lambda (kv-pair) (map (lambda (w) (if (>= (length w) N) (cons w (car kv-pair)) '()) (cadr kv-pair))); mapper
    cons; reducer
    '(); base 
    case"/gutenberg/shakespeare")          ; data


; 2a
(mapreduce 
    (lambda (kv-pair) (cons (caddr kv-pair) 1)); mapper
    +; reducer
    0; base 
    case"/gutenberg/shakespeare")          ; data

