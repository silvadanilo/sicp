(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))


(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (y k)
    (f (+ a (* k h))))
  (define (term k)
    (* (cond ((odd? k) 4)
             ((or (= k 0) (= k n)) 1)
             ((even? k) 2))
       (y k)))
  (/ (* h (sum term 0 inc n)) 3))

(define (cube x) (* x x x))


(newline)
(display "integral: ")
(display (integral cube 0 1 0.01))
(newline)
(display "simpson: ")
(display (simpson cube 0 1 100.0))
(newline)
(newline)

(display "integral: ")
(display (integral cube 0 1 0.001))
(newline)
(display "simpson: ")
(display (simpson cube 0 1 1000.0))
(newline)
