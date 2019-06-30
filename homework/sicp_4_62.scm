(load "query.scm")
(initialize-data-base microshaft-data-base)
(query-driver-loop)


; (assert! (rule (append-to-form () ?y ?y)))
; (assert! (rule (append-to-form (?u . ?v) ?y (?u . ?z))
; (append-to-form ?v ?y ?z)))


; (append-to-form (a b) (c d) ?z)


; (assert! 
;     (rule (last-pair (?u . ?x) ?y) 
;         (or (same ?x ?y) (last-pair ?x ?y))))

(assert! 
    (rule (last-pair (?u . ?x) ?y) 
        (or (and (same ?x ()) (same ?u ?y))
        (last-pair ?x ?y))))

; (assert! 
;     (rule (last-pair (?u . ?x) ?y) 
;         (last-pair ?x (?y))))


; (assert! 
;     (rule (last-pair (?x) (?x))))




(last-pair (3) ?x)
(last-pair (1 2 3) ?x)
(last-pair (2 ?x) (3))