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
