(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
                         (if (not (pair? x))
                           1
                           (count-leaves x)))
                       t)))

(newline)
(display (count-leaves (list 1  (list 2  (list 3 4))))) ; expects 4

(newline)
(display (count-leaves (list 3 1 2 (list 1  (list 2  (list 3 4)))))) ;expects 7
