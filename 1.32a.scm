(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

(define (product f a next b)
  (define (multiply x y)
    (* x y))
  (accumulate multiply 1 f a next b))

(define (factorial n)
  (define (f x) x)
  (define (inc x) (+ x 1))
  (product f 1 inc n))


(newline)
(display "factorial of 4: ")
(display (factorial 4))
(newline)
(display "factorial of 5: ")
(display (factorial 5))
(newline)
(display "factorial of 10: ")
(display (factorial 10))
