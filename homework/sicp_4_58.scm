(load "query.scm")
(initialize-data-base microshaft-data-base)
(query-driver-loop)


(assert! (rule (big-shot person-1)
    (and 
        (job ?person-1 (?division . ?job-1))
        (job ?person-2 (?division . ?job-2))
        (not (outranked-by ?person-1 ?person-2))
)))

(big-shot (Fect Cy D))
(big-shot (Bitdiddle Ben))