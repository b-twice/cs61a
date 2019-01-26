; ; Strategy - fn(customer-hand dealear-hand-so-far)
; ; A hand is a senetence where each word is a card
; ; Dealers face up card is a single word, not se
; ; strategy returns #t or $f

; ; Play a game using a strategy on a randomly shuffled deck
; ; returns 1 0 or -1
; (define (twenty-one strategy)
;   (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
;     (cond ((> (best-total dealer-hand-so-far) 21) 1)
; 	  ((< (best-total dealer-hand-so-far) 17)
; 	   (play-dealer customer-hand
; 			(se dealer-hand-so-far (first rest-of-deck))
; 			(bf rest-of-deck)))
; 	  ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
; 	  ((= (best-total customer-hand) (best-total dealer-hand-so-far)) 0)
; 	  (else 1)))

;   (define (play-customer customer-hand-so-far dealer-up-card rest-of-deck)
;     (cond ((> (best-total customer-hand-so-far) 21) -1)
; 	  ((strategy customer-hand-so-far dealer-up-card)
; 	   (play-customer (se customer-hand-so-far (first rest-of-deck))
; 			  dealer-up-card
; 			  (bf rest-of-deck)))
; 	  (else
; 	   (play-dealer customer-hand-so-far
; 			(se dealer-up-card (first rest-of-deck))
; 			(bf rest-of-deck)))))

;   (let ((deck (make-deck)))
;     (play-customer (se (first deck) (first (bf deck)))
; 		   (first (bf (bf deck)))
; 		   (bf (bf (bf deck))))) )

; (define (make-ordered-deck)
;   (define (make-suit s)
;     (every (lambda (rank) (word rank s)) '(A 2 3 4 5 6 7 8 9 10 J Q K)) )
;   (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C)) )

; (define (make-deck)
;   (define (shuffle deck size)
;     (define (move-card in out which)
;       (if (= which 0)
; 	  (se (first in) (shuffle (se (bf in) out) (- size 1)))
; 	  (move-card (bf in) (se (first in) out) (- which 1)) ))
;     (if (= size 0)
; 	deck
;     	(move-card deck '() (random size)) ))
;   (shuffle (make-ordered-deck) 52) )

; STEP 1
; ; 1. Create a best-total proc that takes a 
; ; hand (se of cards) and returns the total points in the hand
; ; Should return the best total without busting (ace is 1 or 11)

; convert each cards to a number, assuming ace high
; returns a setence e.g. (ad, 8c) => 11, 8
(define (score-cards cards) 
  (define (card-points card) 
      (let ((face (first card)))
          (cond ((equal? face 'a) '11)
          ((equal? face 'k) '10)
          ((equal? face 'q) '10)
          ((equal? face 'j) '10)
          (else face))
      ))
    (if (empty? cards) '()
    (se (card-points (first cards)) (score-cards (bf cards)))))
  
; find number of aces in a hand
(define (count-aces hand) 
  (define (count-ace card) 
    (if (equal? (first card) 'a) 1 0))
  (if (empty? hand) 0
    (+ (count-ace (first hand)) (count-aces (bf hand)))))

; rescore hand by dropping aces till no aces left
(define (rescore-hand hand score aces) 
    (cond ((<= score 21) score)
          ((= aces 0) score)
          (else (rescore-hand hand (- score 10) (- aces 1)))))
      

; get the total of a hand
(define (sum-hand hand)
    (define (count scored-cards)
      (if (empty? scored-cards) 0
      (+ (first scored-cards) (count (bf scored-cards)))))
    (count (score-cards hand)))

(define (best-total hand)
  (rescore-hand hand (sum-hand hand) (count-aces hand)))

(display (best-total '(ad 8s)))    ; in this hand the ace counts as 11
(newline)
;19
(display (best-total '(ad 8s 5h))) ; here it must count as 1 to avoid busting
;14
(newline)
(display (best-total '(ad as 9h))) ; here one counts as 11 and the other as 1



; STEP 2 - Write stop-at-17, take a card if total < 17

(define (stop-at-17 hand)
  (if (>= (sum-hand hand) 17) 







