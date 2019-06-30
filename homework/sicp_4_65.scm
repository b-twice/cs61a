(load "query.scm")
(initialize-data-base microshaft-data-base)
(query-driver-loop)


(rule (wheel ?person)
    (and (supervisor ?middle-manager ?person)
    (supervisor ?x ?middle-manager)))

(wheel ?who)

; because oliver is the boss of many middle managers
; so the condition for the query is satisfied for
; all middle managers
; e.g. get all middle managers
; then get all people who are under the managers
; return the boss