(define (square-list items)
  (if (null? items)
    '()
    (cons (expt (car items) 2) (square-list (cdr items)))))

(define (map-square-list items)
  (map (lambda (x) (expt x 2))
       items))

(newline)
(display "recursive: ")
(display (square-list (list 1 2 3 4)))
;expects (1 4 9 16)

(newline)
(display "with-map: ")
(display (map-square-list (list 1 2 3 4)))
;expects (1 4 9 16)
