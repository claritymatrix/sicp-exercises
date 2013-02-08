; Exercise 1.15: The sine of an angle (specified in radians) and be computed by making use of the approximation sin(x) ~ x if x is sufficiently small, and the trigonometric identity:
;  
;  sin(x) = 3sin(x/3) - 4sin^3(x/3)
;
;; (define (mysin x) 
;;   (- (* 3 (sin (/ x 3)))
;;      (* 4 
;; 	(* (sin (/ x 3)) 
;; 	   (sin (/ x 3)) 
;; 	   (sin (/ x 3))) )))

; For the purposes of this exercise, "sufficiently small" is any angle less than 0.1 radians.
(define p-applied 0)

(define (cube x) (* x x x))

(define (p x) 
  (begin 
    (set! p-applied (+ p-applied 1))
    (- (* 3 x) (* 4 (cube x)))
    )
)

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; (a) How many times is the procedure p applied when (sine 12.15) is evaluated?
(display p-applied)
; => 5    ; <---- five times


