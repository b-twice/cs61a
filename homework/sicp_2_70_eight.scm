(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
    (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
    (if (leaf? tree)
        (list (symbol-leaf tree))
        (caddr tree)))

(define (weight tree)
    (if (leaf? tree)
        (weight-leaf tree)
        (cadddr tree)))

(define (decode bits tree)
    (define (decode-1 bits current-branch)
        (if (null? bits)
            '()
            (let ((next-branch
                (choose-branch (car bits) current-branch)))
            (if (leaf? next-branch)
                (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
                (decode-1 (cdr bits) next-branch)))))
    (decode-1 bits tree))

(define (choose-branch bit branch)
    (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit: CHOOSE-BRANCH" bit))))


(define (adjoin-set x set)
    (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
    (if (null? pairs)
        '()
        (let ((pair (car pairs)))
            (adjoin-set (make-leaf (car pair)  ; symbol
                                    (cadr pair))  ; frequency
                        (make-leaf-set (cdr pairs))))))


(define sample-tree
    (make-code-tree (make-leaf 'A 4)
                    (make-code-tree
                        (make-leaf 'B 2)
                        (make-code-tree
                            (make-leaf 'D 1)
                            (make-leaf 'C 1)))))


(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))

 (define (successive-merge leaf-set) 
     (if (null? (cdr leaf-set)) 
        (car leaf-set)
        (successive-merge 
            (adjoin-set (make-code-tree (car leaf-set) (cadr leaf-set)) (cddr leaf-set)))))

(define (has-symbol? symbol tree) 
    ; (newline)
    ; (display symbol)
    ; (newline)
    ; ; (display tree)
    (pair? (memq symbol (symbols tree))))

(define (encode-symbol symbol tree)
    (cond ((eq? (symbol-leaf tree) symbol) '())
          ((has-symbol? symbol (right-branch tree)) (cons 1 (encode-symbol symbol (right-branch tree))))
          ((has-symbol? symbol (left-branch tree)) (cons 0 (encode-symbol symbol (left-branch tree))))
          (else (error "bad symbol: CHOOSE-BRANCH" symbol))))

(define (encode message tree)
    (if (null? message)
    '()
        (append (encode-symbol (car message) tree)
        (encode (cdr message) tree))))
    

(define htree (generate-huffman-tree 
    (list 
        (list 'A 2) (list 'GET 2) (list 'SHA 3) (list 'WAH 1) 
        (list 'BOOM 1) (list 'JOB 2) (list 'NA 16) (list 'YIP 9))))


(length (encode '(get a job sha na na na na na na na get a job sha na na na na na wah yip yip yip yip yip sha boom) htree))