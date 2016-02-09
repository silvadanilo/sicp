(define (inc x)
  (+ 1 x))

(define (double f)
  (lambda (x)
    (f (f x))))

(newline)
(display (((double (double double)) inc) 5)) ; output 21
