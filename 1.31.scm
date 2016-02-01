(define (product f a next b)
  (if (> a b)
    1
    (* (f a)
       (product f (next a) next b))))

(define (factorial n)
  (define (f x) x)
  (define (inc x) (+ x 1))
  (product f 1 inc n))


(newline)
(display (factorial 5))
