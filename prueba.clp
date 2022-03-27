(deffacts BH
(numeros 5 3 8 14 7 pasos)
(objetivo 21)

)

(defrule suma
?aux <-(numeros $?list1 ?num1 $?list3 ?num2 $?list2 pasos $?pasos)
=>
;(retract ?aux)
(assert (numeros $?list1 (+ ?num1 ?num2) $?list3  $?list2 pasos $?pasos ?num1 suma ?num2 igual a (+ ?num1 ?num2)))
(printout t "SUMA = " (+ ?num1 ?num2) crlf)
)

(defrule resta
?aux <-(numeros $?list1 ?num1 $?list3 ?num2 $?list2 pasos $?pasos)
(test (> (- ?num1 ?num2) 0))
=>
;(retract ?aux)
(assert (numeros $?list1 (- ?num1 ?num2) $?list3  $?list2 pasos $?pasos ?num1 resta ?num2 igual a (- ?num1 ?num2)))
(printout t "RESTA = " (- ?num1 ?num2) crlf)
)

(defrule multiplicacion
?aux <-(numeros $?list1 ?num1 $?list3 ?num2 $?list2 pasos $?pasos)
=>
;(retract ?aux)
(assert (numeros $?list1 (* ?num1 ?num2) $?list3  $?list2 pasos $?pasos ?num1 multiplicacion ?num2 igual a(* ?num1 ?num2)))
(printout t "MULTIPLICACION = " (* ?num1 ?num2) crlf)
)

(defrule division
?aux <-(numeros $?list1 ?num1 $?list3 ?num2 $?list2 pasos $?pasos)
(integerp =(div ?num1 ?num2))
(test (= (mod ?num1 ?num2) 0))

=>
;(retract ?aux)
(assert (numeros $?list1 (/ ?num1 ?num2) $?list3  $?list2 pasos $?pasos ?num1 division ?num2 igual a (/ ?num1 ?num2)))
(printout t "DIVISION = " (/ ?num1 ?num2) crlf)
)

(defrule meta
(declare (salience 100))
(numeros $?list)
(objetivo ?obj)
(test (neq FALSE (member$ ?obj $?list)))
=>
(printout t "FIN" crlf)
(halt)
)