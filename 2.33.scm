(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (append (list (p x)) y)) (list) sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate
    (lambda (x y)
      (+ 1 y))
    0
    sequence))

(newline)
(display (length (list 1 2 3 4))) ;expects 4

(newline)
(display (append (list 1 2) (list 3 4))) ;expects (1 2 3 4)


(newline)
(define (square x)
   (* x x))
(display (map square (list 1 2 3 4))) ;expects (1 4 9 16)
