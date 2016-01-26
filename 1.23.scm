
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

(define (prime? n)
    (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes from to)
  (cond ((even? from)
         (search-for-primes (+ from 1) to))
        ((< from to)
         (timed-prime-test from)
         (search-for-primes (+ from 2) to))))


(define (even? n)
  (= (remainder n 2) 0))

(search-for-primes 1000000000000 1100000000000)
; Ratio of the speed is improved of 1.5, I think it is not 2 because there are an extra procedure call and and extra `if` call
