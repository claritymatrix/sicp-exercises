; Exercise 1.23: The smallest-divisor procedure shown at the start of this section does lots of needless testing: After it checks to see if the number is divisble by 2, there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the values used for test-divisor (d) should not be 2,3,4,5,6... but rather 2,3,5,7,9... 

; To implement this change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the smallest-divisor procedure to use (next test-divisor) instead of (+ test-divisor 1). With timed-prime-test incorporating this modified version of smallest-divisor, run the test for each of the 12 primes found in Exercise 1.22. 

(define (next n)
  (if (= n 2) 3
      (+ n 2)))

; Since this modification halves the number of test steps, you should expect it to run about twice as fast.

(load "ex-1.22.scm")

(define (find-divisor n d)
  (cond ((divides? d n) d)
	((> (square d) n) n)
	(else (find-divisor n (next d)))))

;; (search-for-primes 100000000001 999999999999)
;; (search-for-primes 100000000000001 999999999999999)
;; (search-for-primes 100000000000000001 999999999999999999)

;; The data: 
;;
;; 100000000003 *** 11
;; 100000000019 *** 11
;; 100000000057 *** 11

;; 100000000000031 *** 347
;; 100000000000067 *** 348
;; 100000000000097 *** 347

;; 100000000000000003 *** 11240
;; 100000000000000013 *** 11123
;; 100000000000000019 *** 11017

(define (average a b c) (/ (+ a b c) 3.0))
(define (ratio m n) (/ m n))
(ratio
 16556.33
 (average 11240 11123 11017))   ;Value: 1.4879865188735772

(ratio
 514.67
 (average 347 348 347))         ;Value: 1.4817754318618042


; Is this expectation confirmed?
;; No.

; If not, what is the observed ratio of the speeds of the speeds of the two algorithms, and how do you explain the fact that it is different from 2?
;; It ran faster, but only 1.48 times faster. Not sure why this is the case.


(newline)
