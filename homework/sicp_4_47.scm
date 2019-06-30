; original 
(define (parse-verb-phrase)
    (define (maybe-extend verb-phrase)
        (amb verb-phrase
            (maybe-extend
                (list 'verb-phrase
                verb-phrase
                (parse-prepositional-phrase)))))
    (maybe-extend (parse-word verbs)))


; new
(define (parse-verb-phrase)
    (amb (parse-word verbs)
        (list 'verb-phrase
            (parse-verb-phrase)
            (parse-prepositional-phrase))))

; first different is we are passing an expression (parse-word verbs) to parse
; rather then the phrase
; we are then calling parse-verb phrase recursively
; the first is (amb ver-phrase (amb ...))
; where this is (amb (exp) (verb-phrase (amb ...) (...)))
; My take is the the order of expressions changed in amb
; does impact the behavior, and the possible options
; will not be evaluated correctl, the verb becomes
; disconnected from verb-phrase


; looks like I was wrong, the issue is infinite recursion between 
; parse-verb-phrase and parse-prepositional-phrase
; wherease this is avoided with the maybe-extend call


(define (parse-simple-noun-phrase)
    (list 'simple-noun-phrase
        (parse-word articles)
        (parse-word nouns)))

(define (parse-sentence)
    (list 'sentence (parse-noun-phrase) (parse-verb-phrase)))

(define (parse-noun-phrase)
    (define (maybe-extend noun-phrase)
        (amb noun-phrase
            (maybe-extend
            (list 'noun-phrase
                noun-phrase
                (parse-prepositional-phrase)))))
    (maybe-extend (parse-simple-noun-phrase)))