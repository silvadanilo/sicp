; h(y0 + 4y1 + 2y2 + 4y3 + 2y4 + ... + 2yn-2 + 4yn-1 + yn) / 3
; where h = (b - a)/n, for some even integer n, and yk = f(a + kh).

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

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
