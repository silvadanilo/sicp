(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))


(define (left-branch mobile)
  (car mobile))

(define (rigth-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cond ((null? (cdr (cdr branch))) (car (cdr branch)))
        (else (cdr branch))))

(define (total-weight mobile)
  (+ (total-branch-weight (left-branch mobile))
     (total-branch-weight (rigth-branch mobile))))


(define (total-branch-weight branch)
  (cond ((pair? (branch-structure branch)) (total-weight (branch-structure branch)))
        (else (branch-structure branch))))

(define b (make-mobile
            (make-branch 111 (make-mobile
                             (make-branch 2 7)
                             (make-branch 2 9)))
            (make-branch 222 3)))

(newline)
(display (total-weight b)) ; expects 19
