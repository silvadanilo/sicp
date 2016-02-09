(define (square x)
  (* x x))

; without using compose
; (define (repeated f n)
;   (define (iter i result)
;     (if (> i n)
;         result
;         (iter (+ 1 i) (f result))))
;   (lambda (x) (iter 1 x)))


; using compose
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose (repeated f (- n 1)) f)))

(newline)
(display ((repeated square 2) 5)) ;should be 625
