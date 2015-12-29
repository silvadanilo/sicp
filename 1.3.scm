(load "test-manager/load.scm")

(define (square a) (* a a))

(define (major a b) (if (> a b) a b))

(define (sumOfTheSquareOfTheTwoMajorArguments a b c)
  (cond ((> a b) (+ (square a) (square (major b c))))
        ((> b a) (+ (square b) (square (major a c))))))

; This is a test group named simple-stuff
(in-test-group
  square-stuff

; This is one test named arithmetic
(define-test (square)
    "Checking that square procedure works right"
    (check (= 25 (square 5)) "Square of 5 should be 25")
))

(define-test (major)
    "return the major values"
    (check (= 2 (major 1 2)) "2 is greater than 1")
    (check (= 2 (major 2 1)) "2 is greater than 1")
))

(define-test (sumOfTheSquareOfTheTwoMajorArguments)
    "return the sum of the square of the two major arguments"
    (check (= 52 (sumOfTheSquareOfTheTwoMajorArguments 2 4 6)) "sum of square of 6 and square of 4 is 52")
    (check (= 74 (sumOfTheSquareOfTheTwoMajorArguments 5 3 7)) "sum of square of 5 and square of 7 is 74")
    (check (= 130 (sumOfTheSquareOfTheTwoMajorArguments 9 7 3)) "sum of square of 9 and square of 7 is 130")
))

(run-registered-tests)
