Class {
	#name : #Cuenta,
	#superclass : #Object,
	#instVars : [
		'saldo',
		'cliente'
	],
	#category : #'Ejercicio1-model'
}

{ #category : #'instance creation' }
Cuenta class >> paraElCliente: unCliente [

	^ self new initializeParaElCliente: unCliente
]

{ #category : #'as yet unclassified' }
Cuenta >> agregarSaldo: unaCantidad [ 
	saldo := saldo + unaCantidad.
]

{ #category : #'as yet unclassified' }
Cuenta >> descontarSaldo: unaCantidad [	 
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
Cuenta >> enviarDinero: unaCantidad aCuenta: aCajaDeAhorro [ 
	self descontarSaldo: unaCantidad.
	aCajaDeAhorro agregarSaldo: unaCantidad.
]

{ #category : #initialization }
Cuenta >> initializeParaElCliente: unCliente [

	saldo := 0.
	cliente := unCliente.
]

{ #category : #'as yet unclassified' }
Cuenta >> obtenerSaldo [
	^ saldo
]
