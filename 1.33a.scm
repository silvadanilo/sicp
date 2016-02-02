(define (filtered-accumulate filtering combiner null-value term a next b)
  (define (filtered-value a)
    (if (filtering a)
      (term a)
      null-value))
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a)
            (combiner (filtered-value a) result))))
  (iter a null-value))

(define (sum-of-square-of-prime a b)
  (define (add x y) (+ x y))
  (define (square x) (* x x))
  (define (inc x) (+ x 1))
  (filtered-accumulate prime? add 0 square a inc b))


(define (prime? n)
    (= n (smallest-divisor n)))
(define (next divisor)
  (if (= 2 divisor)
      3
      (+ 2 divisor)))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))


(newline)
(display "sum of square of prime from 1 to 12: ")
(display (sum-of-square-of-prime 1 12))
