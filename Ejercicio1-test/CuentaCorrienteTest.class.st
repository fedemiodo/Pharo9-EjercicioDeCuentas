Class {
	#name : #CuentaCorrienteTest,
	#superclass : #TestCase,
	#category : #'Ejercicio1-test'
}

{ #category : #tests }
CuentaCorrienteTest >> test01_AgregarSaldoACuentaCorrienteYVerificarCliente [

	| unaCuentaCorriente |
	unaCuentaCorriente := CuentaCorriente
		                      paraElCliente: 'Juan'
		                      conElNumeroDeCuenta: 1
		                      conMoneda: 'Pesos'.
	unaCuentaCorriente agregarSaldo: 10.

	self assert: unaCuentaCorriente obtenerSaldo equals: 10.
	self assert: unaCuentaCorriente obtenerCliente equals: 'Juan'
]

{ #category : #tests }
CuentaCorrienteTest >> test02_CreacionCuentaCorrienteSinSaldo [

	| unaCuentaCorriente |
	unaCuentaCorriente := CuentaCorriente
		                      paraElCliente: 'Juan'
		                      conElNumeroDeCuenta: 1
		                      conMoneda: 'Pesos'.

	self assert: unaCuentaCorriente obtenerSaldo equals: 0
]

{ #category : #tests }
CuentaCorrienteTest >> test03_DescontarSaldoACuentaCorriente [

	| unaCuentaCorriente |
	unaCuentaCorriente := CuentaCorriente
		                      paraElCliente: 'Juan'
		                      conElNumeroDeCuenta: 1
		                      conMoneda: 'Pesos'.
	unaCuentaCorriente descontarSaldo: 10.

	self assert: unaCuentaCorriente obtenerSaldo equals: -10
]

{ #category : #tests }
CuentaCorrienteTest >> test04_CreacionDeCuentaCorrienteEnDolares [

	| unaCuentaCorriente |
	unaCuentaCorriente := CuentaCorriente
		                      paraElCliente: 'Juan'
		                      conElNumeroDeCuenta: 1
		                      conMoneda: 'Dolares'.

	self assert: unaCuentaCorriente obtenerMoneda equals: 'Dolares'
]

{ #category : #tests }
CuentaCorrienteTest >> test05_VerificarIgualdadObservacional [

	| unaCuentaCorriente |
	unaCuentaCorriente := CuentaCorriente
		                      paraElCliente: 'A'
		                      conElNumeroDeCuenta: 1
		                      conMoneda: 'Pesos'.

	self
		assert: unaCuentaCorriente asString
		equals:
			('Cuenta corriente numero <1p> a nombre de <2s> con moneda en <3s> y saldo <4p>'
				 expandMacrosWith: unaCuentaCorriente obtenerNumeroDeCuenta
				 with: unaCuentaCorriente obtenerCliente
				 with: unaCuentaCorriente obtenerMoneda
				 with: unaCuentaCorriente obtenerSaldo)
]

{ #category : #tests }
CuentaCorrienteTest >> test06_CreacionDeCuentaCorrienteEnPesos [

	| unaCuentaCorriente |
	unaCuentaCorriente := CuentaCorriente
		                      paraElCliente: 'Juan'
		                      conElNumeroDeCuenta: 1
		                      conMoneda: 'Pesos'.

	self assert: unaCuentaCorriente obtenerMoneda equals: 'Pesos'
]
