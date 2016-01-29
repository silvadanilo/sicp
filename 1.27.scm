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

(define (demonstration-iter n a)
  (cond ((= 1 a) #t)
        (else (if (fermat-test n a)
                  (demonstration-iter n (- a 1))
                  #f))))

(define (demonstration n)
  (demonstration-iter n n))

(demonstration 1) #t
(demonstration 3) #t
(demonstration 5) #t
(demonstration 7) #t
(demonstration 11) #t
(demonstration 13) #t
(demonstration 17) #t
(demonstration 19) #t
(demonstration 21) #t

(demonstration 561) #t
(demonstration 1105) #t
(demonstration 1729) #t
(demonstration 2465) #t
(demonstration 2821) #t
(demonstration 6601) #t
