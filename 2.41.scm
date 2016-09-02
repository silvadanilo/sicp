(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-triples n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (cons i j))
           (unique-pair (- i 1))))
    (enumerate-interval 1 n)))

(define (unique-pair n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (sum-of-list-is? l s)
  (= s (accumulate + 0 l)))

(define (make-triple-sum triple)
  (append triple (list (accumulate + 0 triple))))

(define (sum-is-s-with-triple-dinstinct-integers-less-than-n s n)
  (map make-triple-sum
       (filter
         (lambda (x) (sum-of-list-is? x s))
         (unique-triples n))))


(newline)
(display (sum-is-s-with-triple-dinstinct-integers-less-than-n 12 10))
