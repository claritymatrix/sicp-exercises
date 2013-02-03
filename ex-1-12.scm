; Exercise 1.12: The following pattern of numbers is called Pascal's Triangle:
;        1
;      1   1
;    1   2   1
;  1   3   3   1
;  
;   (1   2   1)    row 
;   / \ / \ / \
; (1   3  3   1)   next-row
;

(define (pascal row)        ; pascal maps row |--> next-row
  (define (pascal-cdr row)
    (if (< (length row) 2)
	(if (= (length row) 0)
	    '()
	    '(1))
	(cons (+ (car row) (car (cdr row)))
	      (pascal-cdr (cdr row)))))

  (cons 1 (pascal-cdr row)))


(pascal '())                                      ; => (1)
(pascal (pascal '()))                             ; => (1 1)
(pascal (pascal (pascal '())))                    ; => (1 2 1)
(pascal (pascal (pascal (pascal '()))))           ; => (1 3 3 1)
(pascal (pascal (pascal (pascal (pascal '())))))  ; => (1 4 6 4 1)
