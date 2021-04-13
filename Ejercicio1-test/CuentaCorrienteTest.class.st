Class {
	#name : #CuentaCorrienteTest,
	#superclass : #TestCase,
	#category : #'Ejercicio1-test'
}

{ #category : #tests }
CuentaCorrienteTest >> testAgregarSaldoACuentaCorriente [
| unaCuentaCorriente |
unaCuentaCorriente:= CuentaCorriente new.
unaCuentaCorriente agregarSaldo:  10.
self assert: unaCuentaCorriente obtenerSaldo  equals: 10.
]

{ #category : #tests }
CuentaCorrienteTest >> testCreacionCuentaCorrienteSinSaldo [
	| cuentaCorriente |
	cuentaCorriente:= CuentaCorriente new. 
	self assert: cuentaCorriente obtenerSaldo equals: 0.
]

{ #category : #tests }
CuentaCorrienteTest >> testDescontarSaldoACuentaCorriente [
| unaCuentaCorriente |
unaCuentaCorriente:= CuentaCorriente new.
unaCuentaCorriente descontarSaldo: 10.
self assert: unaCuentaCorriente obtenerSaldo  equals: -10.
]
