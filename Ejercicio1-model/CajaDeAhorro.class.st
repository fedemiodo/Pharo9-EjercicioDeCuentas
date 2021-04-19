Class {
	#name : #CajaDeAhorro,
	#superclass : #Cuenta,
	#category : #'Ejercicio1-model'
}

{ #category : #'as yet unclassified' }
CajaDeAhorro >> descontarSaldo: unaCantidad [	 
		
	AssertionChecker enforce: [self obtenerSaldo > unaCantidad]  because: [ 'No hay saldo suficiente' ].
	
	saldo:= saldo - unaCantidad .
]

{ #category : #'as yet unclassified' }
CajaDeAhorro >> obtenerMoneda [ 
	
	^ moneda
]

{ #category : #'as yet unclassified' }
CajaDeAhorro >> printOn: aStream [	 
	
	aStream nextPutAll: ('Caja de ahorro numero <1p> a nombre de <2s> con moneda en <3s> y saldo <4p>' expandMacrosWith: self obtenerNumeroDeCuenta with: self obtenerCliente with: self obtenerMoneda with: self obtenerSaldo).
	
]
