Class {
	#name : #CuentaCorrienteTest,
	#superclass : #TestCase,
	#category : #'Ejercicio1-test'
}

{ #category : #tests }
CuentaCorrienteTest >> test01_AgregarSaldoACuentaCorrienteYVerificarCliente [
	
	| unaCuentaCorriente |
	
	unaCuentaCorriente:= CuentaCorriente paraElCliente: 'Juan' conElNumeroDeCuenta: 1 .
	unaCuentaCorriente agregarSaldo:  10.
	
	self assert: unaCuentaCorriente obtenerSaldo  equals: 10.
	self assert: unaCuentaCorriente obtenerCliente  equals: 'Juan'.
]

{ #category : #tests }
CuentaCorrienteTest >> test02_CreacionCuentaCorrienteSinSaldo [

	| unaCuentaCorriente |
	
	unaCuentaCorriente:= CuentaCorriente paraElCliente: 'Juan' conElNumeroDeCuenta: 1 .
	
	self assert: unaCuentaCorriente obtenerSaldo equals: 0.
]

{ #category : #tests }
CuentaCorrienteTest >> test03_DescontarSaldoACuentaCorriente [

	| unaCuentaCorriente |
	
	unaCuentaCorriente:= CuentaCorriente paraElCliente: 'Juan' conElNumeroDeCuenta: 1 .
	unaCuentaCorriente descontarSaldo: 10.
	
	self assert: unaCuentaCorriente obtenerSaldo  equals: -10.
]

{ #category : #tests }
CuentaCorrienteTest >> test04_VerificarMonedaCuentaCorriente [

	| unaCuentaCorriente |
	
	unaCuentaCorriente:= CuentaCorriente paraElCliente: 'Juan' conElNumeroDeCuenta: 1 .
	
	self assert: unaCuentaCorriente obtenerMoneda  equals: 'Dolares'
]

{ #category : #tests }
CuentaCorrienteTest >> test05_VerificarIgualdadObservacional [

	| unaCuentaCorriente |
	unaCuentaCorriente := CuentaCorriente paraElCliente: 'A' conElNumeroDeCuenta: 1 .
	
	self assert: unaCuentaCorriente asString  equals: ('Cuenta corriente numero <1p> a nombre de <2s> con moneda en <3s> y saldo <4p>' expandMacrosWith: unaCuentaCorriente obtenerNumeroDeCuenta with:unaCuentaCorriente obtenerCliente with: unaCuentaCorriente obtenerMoneda with: unaCuentaCorriente obtenerSaldo).
]

{ #category : #tests }
CuentaCorrienteTest >> test06_Depositar100PesosACajasEnDolares [

	| unaColeccionDeCuentasCorrientes unaCuentaCorriente unaCuentaCorriente2 | 
	
	unaCuentaCorriente  := CuentaCorriente  paraElCliente: 'Juan' conElNumeroDeCuenta: 1 .
	unaCuentaCorriente2  := CuentaCorriente  paraElCliente: 'Marcelo' conElNumeroDeCuenta: 2 .


	unaColeccionDeCuentasCorrientes   := OrderedCollection new
		                         add: unaCuentaCorriente ;
		                         add: unaCuentaCorriente2 ;
		                         yourself.

	unaColeccionDeCuentasCorrientes   do: [ :unaCuenta | unaCuenta agregarSaldo: 100 ].

	unaColeccionDeCuentasCorrientes   do: [ :unaCuenta | self assert: unaCuenta obtenerSaldo  equals: 100 ].
]
