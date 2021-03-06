Class {
	#name : #Cuenta,
	#superclass : #Object,
	#instVars : [
		'saldo',
		'cliente',
		'numeroDeCuenta',
		'moneda'
	],
	#category : #'Ejercicio1-model'
}

{ #category : #'instance creation' }
Cuenta class >> paraElCliente: unCliente conElNumeroDeCuenta: unNumeroDeCuenta conMoneda: unaMoneda [

	self validarCliente: unCliente.

	^ self new
		  initializeParaElCliente: unCliente
		  conElNumeroDeCuenta: unNumeroDeCuenta
		  conMoneda: unaMoneda
]

{ #category : #'as yet unclassified' }
Cuenta class >> validarCliente: unCliente [

	unCliente isNotEmpty
		ifTrue:[]
		ifFalse: [InstanceCreationFailed signal:'El cliente no puede tener el nombre vacio.']
]

{ #category : #'as yet unclassified' }
Cuenta >> = otraCuenta [

	^ (self obtenerCliente = otraCuenta obtenerCliente) and: [ self obtenerMoneda = otraCuenta obtenerMoneda and: [ self obtenerSaldo = otraCuenta obtenerSaldo and:[self obtenerNumeroDeCuenta = otraCuenta obtenerNumeroDeCuenta  ] ] ]
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
Cuenta >> enviarDinero: unaCantidad aCuenta: aOtraCuenta [

	(self tieneMismaMonedaQue: aOtraCuenta)
		 ifTrue: [self descontarSaldo: unaCantidad. aOtraCuenta agregarSaldo: unaCantidad.]
		 ifFalse: [ Exception signal: 'Conflicto de monedas. Emisor y receptor no comparten tipo de moneda.' ].

]

{ #category : #initialization }
Cuenta >> initializeParaElCliente: unCliente conElNumeroDeCuenta: unNumeroDeCuenta conMoneda: unaMoneda [

	saldo := 0.
	numeroDeCuenta:= unNumeroDeCuenta .
	moneda := unaMoneda .
	cliente := unCliente.
]

{ #category : #'as yet unclassified' }
Cuenta >> obtenerCliente [

	^ cliente
]

{ #category : #'as yet unclassified' }
Cuenta >> obtenerMoneda [

	self subclassResponsibility .
]

{ #category : #'as yet unclassified' }
Cuenta >> obtenerNumeroDeCuenta [

	^ numeroDeCuenta 
]

{ #category : #'as yet unclassified' }
Cuenta >> obtenerSaldo [

	^ saldo
]

{ #category : #'as yet unclassified' }
Cuenta >> tieneMismaMonedaQue: otraCuenta [

	^ self obtenerMoneda = otraCuenta obtenerMoneda.
]

{ #category : #'as yet unclassified' }
Cuenta >> tieneSaldoNegativo [

	^ self obtenerSaldo  negative.
]
