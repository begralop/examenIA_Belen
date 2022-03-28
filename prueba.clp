(deffacts inicial
	(robot posicion 1 cajasnaranjas 0 cajasmanzanas 0 cajascaquis 0 cajasuvas 0 cajastotales 0)
	(paletnaranjas posicion 2 stock 10)
	(paletmanzanas posicion 3 stock 10)
	(paletcaquis posicion 4 stock 10)
	(paletuva posicion 5 stock 10)
	(lineapedido posicion 0 cajas 0)
	(maxcajasrobot 3)
	(pedido naranjas 2 manzanas 3 uva 1)
)

(defrule desplazarse-drc 
	(robot ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales)
	(test (<= ?posicionrobot 4))
	=>
	(assert (robot (+ ?posicionrobot 1) cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales))
)

(defrule desplazarse-izq 
	(robot ?posicionrobot cajas ?cajas)
	(test (> ?posicionrobot 0))
	=>
	(assert (robot (- ?posicionrobot 1) cajas ?cajas))
)

(defrule recogernaranjas
	(robot ?posicionrobot cajas ?cajas)
	(paletnaranjas posicion ?posicion stock ?stock)
	(maxcajasrobot ?maxcajasrobot)
	(test (<= ?cajas ?maxcajasrobot))
	(test (= ?posicionrobot ?posicion))
	(test (> ?stock 0))
	=>
	(assert (robot ?posicionrobot cajas ?cajas))
	(assert (paletnaranjas posicion ?posicion stock (- ?stock 1)))
	(printout t "Una caja de naranjas recogida" crlf)
)

(defrule recogermanzanas
	(robot ?posicionrobot cajas ?cajas)
	(paletmanzanas posicion ?posicion stock ?stock)
	(maxcajasrobot ?maxcajasrobot)
	(test (<= ?cajas ?maxcajasrobot))
	(test (= ?posicionrobot ?posicion))
	(test (> ?stock 0))
	=>
	(assert (robot ?posicionrobot cajas ?cajas))
	(assert (paletmanzanas posicion ?posicion stock (- ?stock 1)))
	(printout t "Una caja de manzanas recogida" crlf)
)

(defrule recogercaquis
	(robot ?posicionrobot cajas ?cajas)
	(paletcaquis posicion ?posicion stock ?stock)
	(maxcajasrobot ?maxcajasrobot)
	(test (<= ?cajas ?maxcajasrobot))
	(test (= ?posicionrobot ?posicion))
	(test (> ?stock 0))
	=>
	(assert (robot ?posicionrobot cajas ?cajas))
	(assert (paletcaquis posicion ?posicion stock (- ?stock 1)))
	(printout t "Una caja de caquis recogida" crlf)
)

(defrule recogeruvas
	(robot ?posicionrobot cajas ?cajas)
	(paletuvas posicion ?posicion stock ?stock)
	(maxcajasrobot ?maxcajasrobot)
	(test (<= ?cajas ?maxcajasrobot))
	(test (= ?posicionrobot ?posicion))
	(test (> ?stock 0))
	=>
	(assert (robot ?posicionrobot cajas ?cajas))
	(assert (paletuvas posicion ?posicion stock (- ?stock 1)))
	(printout t "Una caja de uvas recogida" crlf)
)

(defrule dejarcajas
	(robot ?posicionrobot cajas ?cajas)
	(lineapedido posicion ?posicion cajasapiladas ?cajasapiladas)
	(test (= ?posicionrobot ?posicion))
	=>
	(assert (robot ?posicionrobot cajas 0))
	(assert (lineapedido posicion ?posicion cajasapiladas (+ ?cajasapiladas ?cajasapiladas)))
		
)	

(defrule comprobarstocknaranjas
	(declare (salience 50))
	(paletnaranjas posicion ?posicion stock ?stock)
	(test (= ?stock 0))
	=>
	(halt)
	(printout t "No hay stock de naranjas" crlf)
)

(defrule comprobarstockmanzanas
	(declare (salience 50))
	(paletmanzanas posicion ?posicion stock ?stock)
	(test (= ?stock 0))
	=>
	(halt)
	(printout t "No hay stock de manzanas" crlf)
)

(defrule comprobarstockcaquis
	(declare (salience 50))
	(paletcaquos posicion ?posicion stock ?stock)
	(test (= ?stock 0))
	=>
	(halt)
	(printout t "No hay stock de caquis" crlf)
)

(defrule comprobarstockuvas
	(declare (salience 50))
	(paletuvas posicion ?posicion stock ?stock)
	(test (= ?stock 0))
	=>
	(halt)
	(printout t "No hay stock de uvas" crlf)
)

(defrule meta
	(declare (salience 100))
	(lineapedido posicion ?posicion cajasapiladas ?cajasapiladas)
	(pedido naranjas ?naranjas manzanas ?manzanas uva ?uva)
	
	
	
)
