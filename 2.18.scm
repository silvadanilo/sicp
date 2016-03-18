; iterative version
; (define (reverse items)
;   (define (reverse-iter result i)
;     (if (null? i)
;       result
;       (reverse-iter (append (list (car i)) result) (cdr i))))
;   (reverse-iter (list) items))

; ricorsive version
(define (reverse items)
    (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(newline)
(display (reverse (list 1 4 9 16 25))); expects (25 16 9 4 1)
