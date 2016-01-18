(load "test-manager/load.scm")

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (expt-iter (square b) (/ n 2) a))
        (else (expt-iter b (- n 1) (* a b)))))

(define (fast-expt b n)
  (expt-iter b n 1))

(in-test-group
  fast-expt-even

(define-test (calculate-expt)
    "even exponential"
    (check (= 65536 (fast-expt 4 8)) "...")
))

(in-test-group
  fast-expt-odd

(define-test (calculate-odd-expt)
    "odd exponential"
    (check (= 16384 (fast-expt 4 7)) "...")
))

(run-registered-tests)
