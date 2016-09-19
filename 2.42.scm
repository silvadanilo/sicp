(load "test-manager/load.scm")

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (make-position row col)
  (cons row col))

(define (position-row position)
  (car position))

(define (position-col position)
  (cdr position))

(define (empty-board)
  '())

(define (adjoin-position row col positions)
   (append positions (list (make-position row col))))

(define (safe? col positions)
  (let ((last-queen (list-ref positions (- col 1)))
        (others-queen (reverse (cdr (reverse positions)))))
    (define (iter lq oq)
      (or (null? oq)
        (and (not (collides? lq (car oq)))
             (iter lq (cdr oq)))))
    (iter last-queen others-queen)))

(define (collides? x y)
  (define (same-row? x y)
    (if (= (position-row x) (position-row y))
        #t
        #f))
  (define (same-diagonal? x y)
    (= (abs (- (position-row x)
               (position-row y)))
       (abs (- (position-col x)
               (position-col y)))))
  (or (same-row? x y) (same-diagonal? x y)))

(define (queens board-size)
   (define (queen-cols k)
     (if (= k 0)
         (list (empty-board))
         (filter
          (lambda (positions) (safe? k positions))
          (flatmap
           (lambda (rest-of-queens)
             (map (lambda (new-row)
                    (adjoin-position new-row k rest-of-queens))
                  (enumerate-interval 1 board-size)))
           (queen-cols (- k 1))))))
   (queen-cols board-size))

(in-test-group
  collides?

(define-test (same-row)
    "Checking that 2 positions on same row collides"
    (check (eq? #t (collides? (make-position 2 3) (make-position 2 5))) "two positions on same row should collides")
    (check (eq? #t (collides? (make-position 4 1) (make-position 4 2))) "two positions on same row should collides")
)

(define-test (same-diagonal)
    "Checking that 2 positions on same diagonal collides"
    (check (eq? #t (collides? (make-position 1 1) (make-position 5 5))) "two positions on same diagonal should collides")
    (check (eq? #t (collides? (make-position 3 1) (make-position 5 3))) "two positions on same diagonal should collides")
    (check (eq? #t (collides? (make-position 5 1) (make-position 3 3))) "two positions on same diagonal should collides")
    (check (eq? #t (collides? (make-position 4 1) (make-position 1 4))) "two positions on same diagonal should collides")
)

(define-test (different-row-and-different-diagonal)
    "Checking that 2 positions on same diagonal collides"
    (check (eq? #f (collides? (make-position 1 1) (make-position 3 2))) "two positions on different row and different diagonal should not collides")
    (check (eq? #f (collides? (make-position 4 1) (make-position 1 5))) "two positions on different row and different diagonal should not collides")
))

(run-registered-tests)

(newline)
(display (queens 6))
