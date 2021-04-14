Class {
	#name : #CuentaCorrienteTest,
	#superclass : #TestCase,
	#category : #'Ejercicio1-test'
}

{ #category : #tests }
CuentaCorrienteTest >> test01_AgregarSaldoACuentaCorriente [
	
	| unaCuentaCorriente |
	
	unaCuentaCorriente:= CuentaCorriente paraElCliente: 'Juan'.
	unaCuentaCorriente agregarSaldo:  10.
	
	self assert: unaCuentaCorriente obtenerSaldo  equals: 10.
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
