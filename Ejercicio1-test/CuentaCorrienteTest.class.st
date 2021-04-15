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
CuentaCorrienteTest >> test05_VerificarIgualdadObservacional [

	| unaCuentaCorriente |
	unaCuentaCorriente := CuentaCorriente paraElCliente: 'A'.
	
	self assert: unaCuentaCorriente asString  equals: ('Cuenta corriente a nombre de <1s> con moneda en <2s> y saldo <3p>' expandMacrosWith: unaCuentaCorriente obtenerCliente with: unaCuentaCorriente obtenerMoneda with: unaCuentaCorriente obtenerSaldo).
]
