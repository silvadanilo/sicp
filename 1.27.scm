(load "test-manager/load.scm")

(define (expmod base exp m)
   (cond ((= exp 0) 1)
         ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
                      m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n a)
    (= (expmod a n n) a))

; Outline version
; (define (demonstration-iter n a)
;   (cond ((= 1 a) #t)
;         (else (if (fermat-test n (- a 1))
;                   (demonstration-iter n (- a 1))
;                   #f))))

; (define (demonstration n)
;   (demonstration-iter n n))

; Inline version
(define (demonstration n)
  (define (demonstration-iter a)
    (cond ((= 1 a) #t)
          (else (if (fermat-test n (- a 1))
                    (demonstration-iter (- a 1))
                    #f))))
  (demonstration-iter n))

(display (demonstration 1)); #t
(newline)
(display (demonstration 3)); #t
(newline)
(display (demonstration 5)); #t
(newline)
(display (demonstration 7)); #t
(newline)
(display (demonstration 11)); #t
(newline)
(display (demonstration 13)); #t
(newline)
(display (demonstration 17)); #t
(newline)
(display (demonstration 19)); #t
(newline)
(display (demonstration 23)); #t
(newline)

(display (demonstration 561)); #t
(newline)
(display (demonstration 1105)); #t
(newline)
(display (demonstration 1729)); #t
(newline)
(display (demonstration 2465)); #t
(newline)
(display (demonstration 2821)); #t
(newline)
(display (demonstration 6601)); #t
(newline)
