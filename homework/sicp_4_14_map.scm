; Eva Lu Ator and Louis Reasoner are each
; experimenting with the metacircular evaluator. Eva types
; in the definition of map , and runs some test programs that
; use it. ey work fine. Louis, in contrast, has installed the
; system version of map as a primitive for the metacircular
; evaluator. When he tries it, things go terribly wrong. Ex-
; plain why Louis’s map fails even though Eva’s works.

; is this just an install problem?
; shouldn't map be bound as a primitive procedure in the define
; primitive procedures so it can be called??

; after reading comments this is is about mixing up native and interpreted implementations
; the native procedure receiving native input but rather constructs of the interpreted code
; so the native fails out.
; Eva has no issue because she used interpreted code to build the map proc