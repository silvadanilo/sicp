(define (product f a next b)
  (define (product-iter a result)
    (if (> a b)
      result
      (product-iter (next a) (* (f a) result))))
  (product-iter a 1))


(define (factorial n)
  (define (f x) x)
  (define (inc x) (+ x 1))
  (product f 1 inc n))


(newline)
(display (factorial 4))
(newline)
(display (factorial 5))
