(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car z)
  (number-of-time-is-divisible-by 2 z))

(define (cdr z)
  (number-of-time-is-divisible-by 3 z))

(define (number-of-time-is-divisible-by x number)
  (define (iter i result)
    (if (= 0 (remainder result x))
      (iter (+ i 1) (/ result x))
      i))
  (iter 0 number))


(newline)
(display (car (cons 6 5))) ; expects 6
(newline)
(display (cdr (cons 6 5))) ; expects 5

