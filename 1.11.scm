(load "test-manager/load.scm")

(define (recursiveF n)
  (cond ((< n 3) n)
        (else (+
                (recursiveF (- n 1))
                (* 2 (recursiveF (- n 2)))
                (* 3 (recursiveF (- n 3)))))))

(define (iterativeF n)
  (if (< n 3)
      n
      (iterativeF-iter 0 1 2 3 n)))

(define (iterativeF-iter a b c i n)
  (if (> i n)
      c
      (iterativeF-iter b
                       c
                       (+ c (* 2 b) (* 3 a))
                       (+ i 1)
                       n)))


(in-test-group
  recursive

(define-test (lessThanThree)
    "Checking that f returns N when N is less than 3"
    (check (= 2 (recursiveF 2)) "f of 2 should be 2")
)

(define-test (equalsToThree)
    "Checking that f returns `f(n - 1) + 2f(n - 2) + 3f(n - 3)` when N is greater or equal than 3"
    (check (= 4 (recursiveF 3)) "f of 3 should be 4")
)

(define-test (greaterThanThree)
    "Checking that f returns `f(n - 1) + 2f(n - 2) + 3f(n - 3)` when N is greater or equal than 3"
    (check (= 25 (recursiveF 5)) "f of 5 should be 25")
))


(in-test-group
  iterative

(define-test (lessThanThree)
    "Checking that f returns N when N is less than 3"
    (check (= 2 (iterativeF 2)) "f of 2 should be 2")
)

(define-test (equalsToThree)
    "Checking that f returns `f(n - 1) + 2f(n - 2) + 3f(n - 3)` when N is greater or equal than 3"
    (check (= 4 (iterativeF 3)) "f of 3 should be 4")
)

(define-test (greaterThanThree)
    "Checking that f returns `f(n - 1) + 2f(n - 2) + 3f(n - 3)` when N is greater or equal than 3"
    (check (= 25 (iterativeF 5)) "f of 5 should be 25")
)

(define-test (greaterThanThree)
    "Checking that f returns `f(n - 1) + 2f(n - 2) + 3f(n - 3)` when N is greater or equal than 3"
    (check (= 59 (iterativeF 6)) "f of 6 should be 59")
))

(run-registered-tests)
