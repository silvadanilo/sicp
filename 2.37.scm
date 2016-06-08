(load "test-manager/load.scm")

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))


(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n <??> <??> mat))

; (define (matrix-*-matrix m n)
;   (let ((cols (transpose n)))
;     (map <??> m)))


(in-test-group
  dot-product

  (define-test (dot-product)
      "Checking that dot-product writed in the docs in right"
      (check (equal? 100 (dot-product (list 10 10 10 10) (list 1 2 3 4))) "Dot-product should be xxx"))
      ; (check (= (list 1 2 3) (dot-product (list 10 10 10 10) (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))) "Dot-product should be xxx")
)

(in-test-group
  matrix-*-vector

  (define-test (matrix-*-vector)
      "multiply a matrix by a vector"
      (check (equal? (list 300 700) (matrix-*-vector
                         (list (list 1 2 3 4) (list 5 6 7 8))
                         (list 10 20 30 40))))))

(in-test-group
  transpose

  (define-test (transpose)
      "transpose a matrix"
      (check (equal?
               (list (list 1 4 7 10)  (list 2 5 8 11)  (list 3 6 9 12))
               (transpose (list  (list 1 2 3)  (list 4 5 6)  (list 7 8 9)  (list 10 11 12)))))))

(run-registered-tests)
