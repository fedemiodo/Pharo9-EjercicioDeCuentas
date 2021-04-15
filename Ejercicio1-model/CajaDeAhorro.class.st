Class {
	#name : #CajaDeAhorro,
	#superclass : #Cuenta,
	#category : #'Ejercicio1-model'
}

{ #category : #'as yet unclassified' }
CajaDeAhorro >> descontarSaldo: unaCantidad [	 
	self obtenerSaldo < unaCantidad 
		ifTrue: [ Exception signal: 'No hay saldo suficiente' ]
		ifFalse: [ saldo:= saldo - unaCantidad  ]
]

{ #category : #'as yet unclassified' }
CajaDeAhorro >> obtenerMoneda [ 
	
	^ 'Pesos'
]

{ #category : #'as yet unclassified' }
CajaDeAhorro >> printOn: aStream [	 
	
	aStream nextPutAll: ('Caja de ahorro a nombre de <1s> con moneda en <2s> y saldo <3p>' expandMacrosWith: self obtenerCliente with: self obtenerMoneda with: self obtenerSaldo).
	
]
