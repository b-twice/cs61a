; ; Strategy - fn(customer-hand dealear-hand-so-far)
; ; A hand is a senetence where each word is a card
; ; Dealers face up card is a single word, not se
; ; strategy returns #t or $f

; ; Play a game using a strategy on a randomly shuffled deck
; ; returns 1 0 or -1
(define (twenty-one strategy)
  (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
    (cond ((> (best-total dealer-hand-so-far) 21) 1)
	  ((< (best-total dealer-hand-so-far) 17)
	   (play-dealer customer-hand
			(se dealer-hand-so-far (first rest-of-deck))
			(bf rest-of-deck)))
	  ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
	  ((= (best-total customer-hand) (best-total dealer-hand-so-far)) 0)
	  (else 1)))

  (define (play-customer customer-hand-so-far dealer-up-card rest-of-deck)
    (cond ((> (best-total customer-hand-so-far) 21) -1)
	  ((strategy customer-hand-so-far dealer-up-card)
	   (play-customer (se customer-hand-so-far (first rest-of-deck))
			  dealer-up-card
			  (bf rest-of-deck)))
	  (else
	   (play-dealer customer-hand-so-far
			(se dealer-up-card (first rest-of-deck))
			(bf rest-of-deck)))))

  (let ((deck (make-deck)))
    (play-customer (se (first deck) (first (bf deck)))
		   (first (bf (bf deck)))
		   (bf (bf (bf deck))))) )

(define (make-ordered-deck)
  (define (make-suit s)
    (every (lambda (rank) (word rank s)) '(A 2 3 4 5 6 7 8 9 10 J Q K )) )
  (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C) 'XR 'XR) )

(define (make-deck)
  (define (shuffle deck size)
    (define (move-card in out which)
      (if (= which 0)
	  (se (first in) (shuffle (se (bf in) out) (- size 1)))
	  (move-card (bf in) (se (first in) out) (- which 1)) ))
    (if (= size 0)
	deck
    	(move-card deck '() (random size)) ))
  (shuffle (make-ordered-deck) 54) )

; STEP 1
; ; 1. Create a best-total proc that takes a 
; ; hand (se of cards) and returns the total points in the hand
; ; Should return the best total without busting (ace is 1 or 11)

(define (score-card card) 
    (let ((face (first card)))
        (cond ((equal? face 'a) '11)
        ((equal? face 'x) '11)
        ((equal? face 'k) '10)
        ((equal? face 'q) '10)
        ((equal? face 'j) '10)
        ((equal? face 'j) '10)
        (else (bl card)))
    ))

; convert each cards to a number, assuming ace high
; returns a setence e.g. (ad, 8c) => 11, 8
(define (score-cards cards) 
    (if (empty? cards) '()
    (se (score-card (first cards)) (score-cards (bf cards)))))
  
; find number of aces in a hand
(define (count-card-types hand card-type) 
  (define (count-card-type card) 
    (if (equal? (first card) card-type) 1 0))
  (if (empty? hand) 0
    (+ (count-card-type (first hand)) (count-card-types (bf hand) card-type))))

; find number of aces in a hand
(define (count-cards-by-suit hand suit-type) 
  (define (count-card-by-suit card) 
    (if (equal? (bf card) suit-type) 1 0))
  (if (empty? hand) 0
    (+ (count-card-by-suit (first hand)) (count-cards-by-suit (bf hand) suit-type))))


(define (subtract-joker score total) 
  (define (iter score total counter) (
    (if (= counter 1) score
    (iter score total (- counter 1)
  ))
  (iter score total 10))

; rescore hand by dropping aces till no aces left
(define (rescore-hand hand score aces jokers total) 
    (cond ((<= score total) score)
          ((> aces 0) (rescore-hand hand (- score 10) (- aces 1) jokers total))
          ((> jokers 0) (rescore-hand hand (- total score) aces (- jokers 1) total))
          (else score)))
      

; get the total of a hand
(define (sum-hand hand)
    (define (count scored-cards)
      (if (empty? scored-cards) 0
      (+ (first scored-cards) (count (bf scored-cards)))))
    (count (score-cards hand)))

(define (best-total hand)
  (rescore-hand hand (sum-hand hand) (count-card-types hand 'a) (count-card-types hand 'x) 21))

; (display (best-total '(ad xr)))    ; in this hand the ace counts as 11
; (newline)
; ;19
; (display (best-total '(ad 8s 5h))) ; here it must count as 1 to avoid busting
; ;14
; (newline)
; (display (best-total '(ad as 9h))) ; here one counts as 11 and the other as 1



; STEP 2 - Write stop-at-17, take a card if total < 17

; (define (stop-at-17 current-hand dealer-card)
;   (let ((score (rescore-hand hand (sum-hand hand) (count-card-types hand 'a') 17)))
;     (if (>= score 17) #f (#t))))

; STEP 3 - Play some strategies


;n = number of games
;play with strategy
; return # of games won minus lost
(define (play-n strategy n)
  (if (= n 0) 0
  (+ (twenty-one strategy) (play-n strategy (- n 1)))))

; (trace play-n)
; (play-n stop-at-17 5)

; STEP 4 - New strategy dealaer sensitive

; (define (high-sensitive? customer-score dealer-card)
;   (cond ((>= customer-score 17) #f)
;         ((< dealer-card 7) #f)
;         (else #t)))

; (define (low-sensitive? customer-score dealer-card)
;   (cond ((>= customer-score 12) #f)
;         ((> dealer-card 6) #f)
;         (else #t)))


; (define (dealer-sensitive current-hand dealer-card)
;   ; dealer has ace, 7, 8, 9, 10, picture and custom less than 17
;   ; OR dealer has 2, 3, 4, 5, 6 and custom less thatn 12

;   (let ((total (sum-hand current-hand))
;         (dealer-total (score-card dealer-card)))
;   (cond ((high-sensitive? total dealer-total) #t)
;         ((low-sensitive? total dealer-total) #t)
;     (else #f))))

; (trace play-n)
; (play-n dealer-sensitive 5)


; STEP 5 - Generalize part 2 defining a function stop-at

(define (stop-at n)
    (define (strategy hand dealer-hand) 
      (let ((score (rescore-hand hand (sum-hand hand) (count-card-types hand 'a) (count-card-types hand 'x) n)))
        (newline)
        (display score)
        (newline)
        (display n)
        (if (>= score n) #f #t)))
  strategy)

(trace play-n)
; (play-n (stop-at 17) 5)
(display ((stop-at 17) '(10d 10d 10d xr) '8d))


; STEP 6 - Valentine strategy, stop at 17 unless heart stop at 19

; (define (valentine-strategy current-hand dealer-hand)
;     (let ((score (rescore-hand current-hand (sum-hand current-hand) (count-card-types current-hand 'a) 17))
;           (heart-count (count-cards-by-suit current-hand 'h)))
;       (cond ((>= score 19) #f) ; stop at 19
;             ((> heart-count 0) #t) ; keep going if hearts
;             ((>= score 17) #f) ; stop if no hearts and at 17
;       (else #t))
;       ))

; (trace valentine-strategy)
; (play-n valentine-strategy 5)


; STEP 7 - Suit strategy, generalize valentine


; (define (suit-strategy suit-type))
;   (define (strategy current-hand dealer-hand)
;       (let ((score (rescore-hand current-hand (sum-hand current-hand) (count-card-types current-hand 'a) 17))
;             (suit-count (count-cards-by-suit current-hand suit-type)))
;         (cond ((>= score 19) #f) ; stop at 19
;               ((> heart-count 0) #t) ; keep going if hearts
;               ((>= score 17) #f) ; stop if no hearts and at 17
;         (else #t))
;         ))
;   (strategy)

(define (suit-strategy suit-type include-strategy exclude-strategy)
  (define (strategy current-hand dealer-hand)
      (if (> (count-cards-by-suit current-hand suit-type) 0) (include-strategy current-hand dealer-hand)
        (exclude-strategy current-hand dealer-hand)))
  strategy)

; (trace play-n)
; (play-n (suit-strategy 'h (stop-at 19) (stop-at 17)) 5)
; (suit-strategy 'h (stop-at 19) (stop-at 17))



; STEP 8 - Majority strategy, generalize valentine

(define (majority s1 s2 s3)
  (define (strategy hand dealer-hand)
    (if (and (equal? (s1 hand dealer-hand) #f) (equal? (s2 hand dealer-hand) #f) (equal? (s3 hand dealer-hand) #f)) #f 
      #t))
  strategy)


; (trace play-n)
; (play-n (majority (stop-at 1) (stop-at 2) (stop-at 3)) 5)

; STEP 9 - Reckless

(define (reckless s)
  (lambda (hand dealer-hand) 
    (if (equal? (s (bl hand) dealer-hand) #f) #f
    #t)))
  
; (trace play-n)
; (play-n (reckless (stop-at 5)) 5)