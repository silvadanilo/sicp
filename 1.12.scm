(load "test-manager/load.scm")

(define (pascal row column)
  (cond ((= 1 column) 1)
        ((= row column) 1)
        (else (+ (pascal (- row 1) (- column 1))
                 (pascal (- row 1) column)))))


(in-test-group
  recursive

(define-test (calculate-pascal)
    "..."
    (check (= 1 (pascal 1 1)) "...")

    (check (= 1 (pascal 2 1)) "...")
    (check (= 1 (pascal 2 2)) "...")

    (check (= 1 (pascal 3 1)) "...")
    (check (= 2 (pascal 3 2)) "...")
    (check (= 1 (pascal 3 3)) "...")

    (check (= 1 (pascal 4 1)) "...")
    (check (= 3 (pascal 4 2)) "...")
    (check (= 3 (pascal 4 3)) "...")
    (check (= 1 (pascal 4 1)) "...")

    (check (= 1 (pascal 5 1)) "...")
    (check (= 4 (pascal 5 2)) "...")
    (check (= 6 (pascal 5 3)) "...")
    (check (= 4 (pascal 5 4)) "...")
    (check (= 1 (pascal 5 5)) "...")
))

(run-registered-tests)
