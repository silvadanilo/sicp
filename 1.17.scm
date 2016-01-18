(load "test-manager/load.scm")

(define (even? n)
  (= (remainder n 2) 0))

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast* x y)
  (cond ((= y 0) 0)
        ((even? y) (fast* (double x) (halve y)))
        (else (+ x (fast* x (- y 1))))))

(in-test-group
  fast*-even

(define-test (calculate-*)
    "even multiply"
    (check (= 24 (fast* 4 6)) "...")
))

(in-test-group
  fast-expt-odd

(define-test (calculate-odd-*)
    "odd multiply"
    (check (= 28 (fast* 4 7)) "...")
))

(run-registered-tests)
