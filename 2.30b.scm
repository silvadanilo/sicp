(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree sub-tree)
           (square sub-tree)))
       tree))

(newline)
(display (square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))))
; expects: (1 (4 (9 16) 25) (36 49))
