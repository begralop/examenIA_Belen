(deffacts inicial
	(robot posicion 1 cajas 0)
	(paletnaranjas posicion 2 stock 10)
	(paletmanzanas posicion 3 stock 10)
	(paletcaquis posicion 4 stock 10)
	(paletuva posicion 5 stock 10)
	(maxcajasrobot 3)
	(pedido naranjas 2 manzanas 3 uva 1)
)

(defrule moverderecha
	(robot ?posicionrobot cajas ?cajas)
	(test (<= ?cajas ?maxcajasrobot))
	=>
	(assert (robot (+ ?xrobot 1) ?yrobot ?paqueterecogido))
)