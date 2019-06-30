(load "query.scm")
(initialize-data-base microshaft-data-base)
(query-driver-loop)

; (rule (replace ?person-1 ?person-2)
;     (or (and (job ?person-1 ?job) (job ?person-2 ?job))
;         (can-do-job ?person-1 ?job)))

(assert! (rule (can-replace ?person-1 ?person-2)
    (and 
        (job ?person-2 ?job-2)
        (job ?person-1 ?job-1)
        (not (same ?person-1 ?person-2))
    ; (job ?person-1 ?job) (job ?person-2 ?job)))
        (or 
            (can-do-job ?job-1 ?job-2)
            (job ?person-1 ?job-2)
        )
    )))


; who can replace
; (can-replace ?p (Fect Cy D))

(and 
    (can-replace ?person-1 ?person-2)
    (salary ?person-1 ?person-1-salary)
    (salary ?person-2 ?person-2-salary)
    (lisp-value < ?person-2-salary ?person-2-salary)
    )




