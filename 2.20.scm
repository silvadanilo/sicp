(define (same-parity first . integers)
  (let ((parity (odd? first)))
    (define (reduce-iter result integers)
      (if (null? integers)
          result
          (if (eq? parity (odd? (car integers)))
              (reduce-iter (append result (list (car integers))) (cdr integers))
              (reduce-iter result (cdr integers)))))
    (reduce-iter (list first) integers)))


(define (odd? int)
  (= 0 (remainder int 2)))

(newline)
(display (same-parity 1 2 3 4 5 6 7)) ; expects (1 3 5 7)

(newline)
(display (same-parity 2 3 4 5 6 7)) ; expects (2 4 6)
