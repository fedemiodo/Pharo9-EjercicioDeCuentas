Class {
	#name : #CajaDeAhorroTest,
	#superclass : #TestCase,
	#category : #'Ejercicio1-test'
}

{ #category : #tests }
CajaDeAhorroTest >> test01_AgregarClienteAlCrearCuenta [

	| cajaDeAhorro |
	cajaDeAhorro := CajaDeAhorro
		                paraElCliente: 'Pepe'
		                conElNumeroDeCuenta: 1
		                conMoneda: 'Pesos'.
	cajaDeAhorro agregarSaldo: 5.
	self assert: cajaDeAhorro obtenerSaldo equals: 5.
	self assert: cajaDeAhorro obtenerCliente equals: 'Pepe'
]

{ #category : #tests }
CajaDeAhorroTest >> test02_AgregarSaldoAInstancia [

	| cajaDeAhorro |
	cajaDeAhorro := CajaDeAhorro
		                paraElCliente: 'Juan'
		                conElNumeroDeCuenta: 1
		                conMoneda: 'Pesos'.
	cajaDeAhorro agregarSaldo: 5.

	self assert: cajaDeAhorro obtenerSaldo equals: 5
]

{ #category : #tests }
CajaDeAhorroTest >> test03_AgregarYDescontarSaldoMuchasVeces [

	| cajaDeAhorro |
	cajaDeAhorro := CajaDeAhorro
		                paraElCliente: 'Juan'
		                conElNumeroDeCuenta: 1
		                conMoneda: 'Moneda'.
	self assert: cajaDeAhorro obtenerSaldo equals: 0.

	cajaDeAhorro agregarSaldo: 24.
	self assert: cajaDeAhorro obtenerSaldo equals: 24.

	cajaDeAhorro descontarSaldo: 17.
	self assert: cajaDeAhorro obtenerSaldo equals: 24 - 17
]

{ #category : #tests }
CajaDeAhorroTest >> test04_CreacionInstanciaSinSaldo [

	| cajaDeAhorro |
	cajaDeAhorro := CajaDeAhorro
		                paraElCliente: 'Juan'
		                conElNumeroDeCuenta: 1
		                conMoneda: 'Pesos'.

	self assert: cajaDeAhorro obtenerSaldo equals: 0
]

{ #category : #tests }
CajaDeAhorroTest >> test05_DescontarSaldoACajaDeAhorro [

	| cajaDeAhorro |
	cajaDeAhorro := CajaDeAhorro
		                paraElCliente: 'Juan'
		                conElNumeroDeCuenta: 1
		                conMoneda: 'Pesos'.

	self assert: cajaDeAhorro obtenerSaldo equals: 0.
	self
		should: [ cajaDeAhorro descontarSaldo: 10 ]
		raise: Exception
		withExceptionDo: [ :error |  ].
	self assert: cajaDeAhorro obtenerSaldo equals: 0
]

{ #category : #tests }
CajaDeAhorroTest >> test06_EnviarDineroAOtraCajaYVerificarSaldos [

	| cajaDeAhorroDeJuan cajaDeAhorroDePepe |
	cajaDeAhorroDeJuan := CajaDeAhorro
		                      paraElCliente: 'Juan'
		                      conElNumeroDeCuenta: 1
		                      conMoneda: 'Pesos'.
	cajaDeAhorroDeJuan agregarSaldo: 50.

	cajaDeAhorroDePepe := CajaDeAhorro
		                      paraElCliente: 'Pepe'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Pesos'.
	self assert: cajaDeAhorroDePepe obtenerSaldo equals: 0.

	cajaDeAhorroDeJuan enviarDinero: 25 aCuenta: cajaDeAhorroDePepe.

	self assert: cajaDeAhorroDeJuan obtenerSaldo equals: 25.
	self assert: cajaDeAhorroDePepe obtenerSaldo equals: 25
]

{ #category : #tests }
CajaDeAhorroTest >> test07_CrearClienteNuloDebeDevolverUnaExcepcion [

	| cajaDeAhorro |
	self
		should: [ 
			cajaDeAhorro := CajaDeAhorro
				                paraElCliente: ''
				                conElNumeroDeCuenta: 1
				                conMoneda: 'Pesos' ]
		raise: Exception
		withExceptionDo: [ :error |  ]
]

{ #category : #tests }
CajaDeAhorroTest >> test08_CreacionDeCajaDeAhorroEnPesos [

	| cajaDeAhorro |
	cajaDeAhorro := CajaDeAhorro
		                paraElCliente: 'Juan'
		                conElNumeroDeCuenta: 1
		                conMoneda: 'Pesos'.
	self assert: cajaDeAhorro obtenerMoneda equals: 'Pesos'
]

{ #category : #tests }
CajaDeAhorroTest >> test09_VerificarQueDosCuentasSeanLaMisma [

	| cajaDeAhorro cajaDeAhorro2 |
	cajaDeAhorro := CajaDeAhorro
		                paraElCliente: 'A'
		                conElNumeroDeCuenta: 1
		                conMoneda: 'Pesos'.
	cajaDeAhorro2 := CajaDeAhorro
		                 paraElCliente: 'A'
		                 conElNumeroDeCuenta: 1
		                 conMoneda: 'Pesos'.

	self assert: cajaDeAhorro equals: cajaDeAhorro2
]

{ #category : #tests }
CajaDeAhorroTest >> test10_ComprobarIgualdadObservacional [

	| cajaDeAhorro |
	cajaDeAhorro := CajaDeAhorro
		                paraElCliente: 'A'
		                conElNumeroDeCuenta: 1
		                conMoneda: 'Pesos'.
	self
		assert: cajaDeAhorro asString
		equals:
			('Caja de ahorro numero <1p> a nombre de <2s> con moneda en <3s> y saldo <4p>'
				 expandMacrosWith: cajaDeAhorro obtenerNumeroDeCuenta
				 with: cajaDeAhorro obtenerCliente
				 with: cajaDeAhorro obtenerMoneda
				 with: cajaDeAhorro obtenerSaldo)
]

{ #category : #tests }
CajaDeAhorroTest >> test11_CreacionDeCajaDeAhorroEnDolares [

	| cajaDeAhorro |
	cajaDeAhorro := CajaDeAhorro
		                paraElCliente: 'Juan'
		                conElNumeroDeCuenta: 1
		                conMoneda: 'Dolares'.
	self assert: cajaDeAhorro obtenerMoneda equals: 'Dolares'
]
