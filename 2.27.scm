(define (deep-reverse items)
  (cond ((null? items) items)
        ((not (pair? items)) items)
        (else (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))))

(define (reverse items)
    (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(define x (list (list 1 2) (list 3 4)))

(newline) (newline)
(display "reverse")
(newline)
(display (reverse x))
; expects ((3 4) (1 2))

(newline) (newline)
(display "deep-reverse")
(newline)
(display (deep-reverse x))
; expects ((4 3) (2 1))
