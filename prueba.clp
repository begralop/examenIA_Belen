(deffacts inicial
	(robot posicion 1 cajasnaranjas 0 cajasmanzanas 0 cajascaquis 0 cajasuvas 0 cajastotales 0)
	(paletnaranjas posicion 2 stock 10)
	(paletmanzanas posicion 3 stock 10)
	(paletcaquis posicion 4 stock 10)
	(paletuva posicion 5 stock 10)
	(lineapedido posicion 0 cajasnaranjas 0 cajasmanzanas 0 cajascaquis 0 cajasuvas 0)
	(maxcajasrobot 3)
	(pedido naranjas 2 manzanas 3 uva 1 caquis 0)
)

(defrule desplazarse-drc 
	(robot posicion ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales)
	(test (<= ?posicionrobot 4))
	=>
	(assert (robot posicion (+ ?posicionrobot 1) cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales))
)

(defrule desplazarse-izq 
	(robot posicion ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales)
	(test (> ?posicionrobot 0))
	=>
	(assert (robot posicion (- ?posicionrobot 1) cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales))
)

(defrule recogernaranjas
	(robot posicion ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales)
	(paletnaranjas posicion ?posicion stock ?stock)
	(maxcajasrobot ?maxcajasrobot)
	(pedido naranjas ?naranjas manzanas ?manzanas uva ?uva caquis ?caquis)
	(test (<= ?cajastotales ?maxcajasrobot))
	(test (= ?posicionrobot ?posicion))
	(test (<= ?cajasnaranjas ?naranjas))
	(test (>= ?stock (- ?naranjas ?stock)))
	=>
	(assert (robot posicion ?posicionrobot cajasnaranjas (+ ?cajasnaranjas 1) cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales (+ ?cajastotales 1)))
	(assert (paletnaranjas posicion ?posicion stock (- ?stock 1)))
	(printout t "Una caja de naranjas recogida" crlf)
)

(defrule recogermanzanas
	(robot posicion ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales)
	(paletmanzanas posicion ?posicion stock ?stock)
	(maxcajasrobot ?maxcajasrobot)
	(pedido naranjas ?naranjas manzanas ?manzanas uva ?uva caquis ?caquis)
	(test (<= ?cajastotales ?maxcajasrobot))
	(test (= ?posicionrobot ?posicion))
	(test (<= ?cajasmanzanas ?manzanas))
	(test (>= ?stock (- ?manzanas ?stock)))
	=>
	(assert (robot posicion ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas (+ ?cajasmanzanas 1) cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales (+ ?cajastotales 1)))
	(assert (paletmanzanas posicion ?posicion stock (- ?stock 1)))
	(printout t "Una caja de manzanas recogida" crlf)
)

(defrule recogercaquis
	(robot posicion ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales)
	(paletcaquis posicion ?posicion stock ?stock)
	(maxcajasrobot ?maxcajasrobot)
	(pedido naranjas ?naranjas manzanas ?manzanas uva ?uva caquis ?caquis)
	(test (<= ?cajastotales ?maxcajasrobot))
	(test (= ?posicionrobot ?posicion))
	(test (<= ?cajascaquis ?caquis))
	(test (>= ?stock (- ?caquis ?stock)))
	=>
	(assert (robot posicion ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis (+ ?cajascaquis 1) cajasuvas ?cajasuvas cajastotales (+ ?cajastotales 1)))
	(assert (paletcaquis posicion ?posicion stock (- ?stock 1)))
	(printout t "Una caja de caquis recogida" crlf)
)

(defrule recogeruvas
	(robot posicion ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales)
	(paletuvas posicion ?posicion stock ?stock)
	(maxcajasrobot ?maxcajasrobot)
	(pedido naranjas ?naranjas manzanas ?manzanas uva ?uva caquis ?caquis)
	(test (<= ?cajastotales ?maxcajasrobot))
	(test (= ?posicionrobot ?posicion))
	(test (<= ?uva ?caquis))
	(test (>= ?stock (- ?uva ?stock)))
	=>
	(assert (robot posicion ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas (+ ?cajasuvas 1) cajastotales (+ ?cajastotales 1)))
	(assert (paletuvas posicion ?posicion stock (- ?stock 1)))
	(printout t "Una caja de uvas recogida" crlf)
)

(defrule dejarcajas
	(robot posicion ?posicionrobot cajasnaranjas ?cajasnaranjas cajasmanzanas ?cajasmanzanas cajascaquis ?cajascaquis cajasuvas ?cajasuvas cajastotales ?cajastotales)
	(lineapedido posicion ?posicion cajasnaranjaslp ?cajasnaranjaslp cajasmanzanaslp ?cajasmanzanaslp cajascaquislp ?cajascaquislp cajasuvaslp ?cajasuvaslp)
	(test (= ?posicionrobot ?posicion))
	=>
	(assert (robot posicion 0 cajasnaranjas 0 cajasmanzanas 0 cajascaquis 0 cajasuvas 0 cajastotales 0))
	(assert (lineapedido posicion ?posicion cajasnaranjaslp (+ ?cajasnaranjaslp ?cajasnaranjas) cajasmanzanaslp (+ ?cajasmanzanaslp ?cajasmanzanas) cajascaquislp (+ ?cajascaquislp ?cajascaquis) cajasuvaslp (+ ?cajasuvaslp ?cajasuvas) ))
		
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
	(declare (salience 200))
	(lineapedido posicion ?posicion cajasnaranjaslp ?cajasnaranjaslp cajasmanzanaslp ?cajasmanzanaslp cajascaquislp ?cajascaquislp cajasuvaslp ?cajasuvaslp)
	(pedido naranjas ?naranjas manzanas ?manzanas uva ?uva caquis ?caquis)
	(test (= ?naranjas ?cajasnaranjaslp))
	(test (= ?manzanas ?cajasmanzanaslp))
	(test (= ?uva ?cajasuvaslp))
	=>
	(halt)
	(printout t "Palet completado" crlf)

)