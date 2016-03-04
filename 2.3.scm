(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-rectangle a b)
  (cons a b))

(define (bottom-left-rectangle rect)
  (car rect))

(define (upper-rigth-rectangle rect)
  (cdr rect))

(define (height-rectangle rect)
  (- (y-point (upper-rigth-rectangle rect))
     (y-point (bottom-left-rectangle rect))))

(define (width-rectangle rect)
  (- (x-point (upper-rigth-rectangle rect))
     (x-point (bottom-left-rectangle rect))))

(define (perimeter-rectangle rect)
  (+ (* 2 (height-rectangle rect))
     (* 2 (width-rectangle  rect))))

(define (area-rectangle rect)
  (* height-rectangle width-rectangle))

(define a (make-point 2 2))
(define b (make-point 5 4))
(define rect (make-rectangle a b))

(display (area-rectangle rect))

; if the rappresentation of rect changed, we should change only width-rectangle and height-rectangle procedure.
