Class {
	#name : #CuentaCorrienteTest,
	#superclass : #TestCase,
	#category : #'Ejercicio1-test'
}

{ #category : #tests }
CuentaCorrienteTest >> test01_AgregarSaldoACuentaCorrienteYVerificarCliente [
	
	| unaCuentaCorriente |
	
	unaCuentaCorriente:= CuentaCorriente paraElCliente: 'Juan'.
	unaCuentaCorriente agregarSaldo:  10.
	
	self assert: unaCuentaCorriente obtenerSaldo  equals: 10.
	self assert: unaCuentaCorriente obtenerCliente  equals: 'Juan'.
]

{ #category : #tests }
CuentaCorrienteTest >> test02_CreacionCuentaCorrienteSinSaldo [

	| unaCuentaCorriente |
	
	unaCuentaCorriente:= CuentaCorriente paraElCliente: 'Juan'.
	
	self assert: unaCuentaCorriente obtenerSaldo equals: 0.
]

{ #category : #tests }
CuentaCorrienteTest >> test03_DescontarSaldoACuentaCorriente [

	| unaCuentaCorriente |
	
	unaCuentaCorriente:= CuentaCorriente paraElCliente: 'Juan'.
	unaCuentaCorriente descontarSaldo: 10.
	
	self assert: unaCuentaCorriente obtenerSaldo  equals: -10.
]

{ #category : #tests }
CuentaCorrienteTest >> test04_VerificarMonedaCuentaCorriente [

	| unaCuentaCorriente |
	
	unaCuentaCorriente:= CuentaCorriente paraElCliente: 'Juan'.
	
	self assert: unaCuentaCorriente obtenerMoneda  equals: 'Dolares'
]

{ #category : #tests }
CuentaCorrienteTest >> test05_EnviarDineroACuentaConDiferenteMoneda [

| cuentaCorriente cajaDeAhorro  |

cuentaCorriente := CuentaCorriente paraElCliente: 'A'.
cajaDeAhorro := CajaDeAhorro paraElCliente: 'B'.

self assert: cuentaCorriente obtenerMoneda  equals: 'Dolares'.
self assert: cajaDeAhorro  obtenerMoneda  equals: 'Pesos'.

cuentaCorriente agregarSaldo: 50.

self should: [ cuentaCorriente enviarDinero: 25 aCuenta: cajaDeAhorro. ] raise: Exception  withExceptionDo: [ :error | ]. 
self assert: cuentaCorriente obtenerSaldo  equals: 50.
self assert: cajaDeAhorro obtenerSaldo  equals: 0.
]
