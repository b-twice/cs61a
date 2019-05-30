; 2. Write and test two functions to manipulate nonnegative proper fractions. 
; The firstfunction,fract-stream, will take as its argument a list of two nonnegative integers, 
; thenumerator and the denominator, in which the numerator is less than the denominator. 
; Itwill return an infinite stream of decimal digits representing the decimal expansion of thefraction. 
; The second function,approximation, will take two arguments: a fraction streamand a nonnegative integernumdigits. 
; It will return a list (not a stream) containing thefirstnumdigitsdigits of the decimal expansion.

; (fract-stream ’(1 7)) 
; should return the stream representing the decimal expansion of17, which is 0.142857142857142857...
; (stream-car (fract-stream ’(1 7))) should return 1.
; (stream-car (stream-cdr (stream-cdr (fract-stream ’(1 7))))) should return 2.
; (approximation (fract-stream ’(1 7)) 4) should return(1 4 2 8).
; (approximation (fract-stream ’(1 2)) 4) should return(5 0 0 0).