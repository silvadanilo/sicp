(define (last-pair l)
  (if (null? (cdr l))
      (list (car l))
      (last-pair (cdr l))))

(newline)
(display (last-pair (list 23 72 149 34))) ; expects (34)
