(load "test-manager/load.scm")

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (average a b)
  (/ (+ a b) 2))

(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment)) (x-point (end-segment segment)))
              (average (y-point (start-segment segment)) (y-point (end-segment segment)))))

(define start (make-point 2 4))
(define end (make-point 8 10))
(define segment (make-segment start end))
(print-point (midpoint-segment segment)) ;It should print `(5,7)`


(in-test-group
  segment-stuff

; This is one test named arithmetic
(define-test (average)
    "Checking that average works right"
    (check (= 4 (average 2 6)) "Average of 2 and 6 should be 4")
)

(define-test (midpoint-segment)
    "Checking that midpoint-segment works right"
    (check (equal?
             (make-point 5 7)
             (midpoint-segment (make-segment (make-point 2 4) (make-point 8 10))))
           "Average of 2 and 6 should be 4")
))

(run-registered-tests)
