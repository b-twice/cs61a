(define (tree-map tree fn)
    (map (lambda (sub-tree)
        (if (pair? sub-tree)
            (tree-map sub-tree fn)
            (fn sub-tree)))
            tree))
(tree-map
    (list 1
    (list 2 (list 3 4) 5)
    (list 6 7)) (lambda (x) (* x x)))
