
; conventional or explicity dispatch
; to incorporate new types, you would need to first define the characteristics or actions of the type
; then update different method calls to handle the various actions
; the challenge is the behavior of a type isn't collectively defined in one spot
; you have to hunt around for the actions that perform on the object. Also puts a risk that
; those methods may be somehow break

;data directed
; creating a new package to populate the global type table with the behaviors 
; cohesive, biggest concern would be collision of namespaces

;message passing
; similar to data directed, just need to a create a new object to handle the behavior
; once an object is constructed, you don't have the ability to pass 
; arguements to individual operation calls, they must rely on the parameters initially passed in
; same goes for data directed