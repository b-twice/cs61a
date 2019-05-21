Starts at $100
Peter: (set! balance (+ balance 10))
Paul: (set! balance (- balance 20))
Mary: (set! balance (- balance (/ balance 2)))


A:
Peter d $10 -> $110
Paul wd $20 -> $90
Mary wd 1/2 -> $45

B:
Paul -> 80
Peter -> 90
Mary -> 45

C:
Mary -> $50
Paul -> $30
Peter -> $40

D: 
Mary -> $50
Peter -> $60
Paul -> $40

E:
Paul -> $80
Mary -> $40
Peter -> 50

F:
Peter -> 110
mary -> 55
Paul -> 35


Interleaving:

Paul -> 80
Mary -> 50 of 100
Peter -> 110

Paul -> 80
Mary -> 50
Peter -> 60