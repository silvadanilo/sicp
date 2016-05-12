(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (superset x s)) rest)))))

(define (superset first s)
  (cons (car s) first))

(display (subsets (list 1 2 3)))
; expects:
; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
