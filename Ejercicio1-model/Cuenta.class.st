Class {
	#name : #Cuenta,
	#superclass : #Object,
	#instVars : [
		'saldo'
	],
	#category : #'Ejercicio1-model'
}

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

{ #category : #'as yet unclassified' }
Cuenta >> initialize [ 
saldo := 0.
]

{ #category : #'as yet unclassified' }
Cuenta >> obtenerSaldo [
	^ saldo
]
