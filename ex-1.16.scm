; Exercise 1.16: Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt

(define (fast-expt b n)       ; Theta(log(n)) space, Theta(log(n)) time
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))


(define (fast-slim-expt b n)  ; Theta(log(n)) space, Theta(1) time
  (define (iter a b n)
    (let ((even? (lambda (m) (= (remainder m 2) 0)))
	  (square (lambda (m) (* m m))))
      (if (= n 0) a
	  (iter (if (even? n) a (* a b))   ;  a <--- (n is even?) a : ab
		(square b)                 ;  b <--- b^2
		(floor (/ n 2))))))        ;  n <--- floor(n/2)
  (iter 1 b n))


; (fast-slim-expt 3 1024)

;Value: 373391848741020043532959754184866588225409776783734007750636931722079040617265251229993688938803977220468765065431475158108727054592160858581351336982809187314191748594262580938807019951956404285571818041046681288797402925517668012340617298396574731619152386723046235125934896058590588284654793540505936202376547807442730582144527058988756251452817793413352141920744623027518729185432862375737063985485319476416926263819972887006907013899256524297198527698749274196276811060702333710356481

; (fast-expt 3 1024)

;Value: 37339184874102004353295975418486658822540977678373400775063693172207904061726525122999368893880397722046876506543147515810872705459216085858135133698280918731419174859426258093880701995195640428557181804104668128879740292551766801234061729839657473161915238672304623512593489605859058828465479354050593620237654780744273058214452705898875625145281779341335214192074462302751872918543286237573706398548531947641692626381997288700690701389925652429719852769874927419627681106070233371035648

			
