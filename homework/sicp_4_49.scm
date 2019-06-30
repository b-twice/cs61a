(define (parse-word word-list)
    (require (not (null? *unparsed*)))
    ; (require (memq (car *unparsed*) (cdr word-list)))
    ; don't need a restriction that the word is in the word list
    ; instead of taking the unparsed word, we take a random one
    (let ((found-word (random-word (cdr word-list))))
        (set! *unparsed* (cdr *unparsed*))
        (list (car word-list) found-word)))
    
(define (random-word word-list)
    (list-ref word-list (random (length word-list))))