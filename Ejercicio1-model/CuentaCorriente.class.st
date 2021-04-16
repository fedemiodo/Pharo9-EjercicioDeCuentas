Class {
	#name : #CuentaCorriente,
	#superclass : #Cuenta,
	#category : #'Ejercicio1-model'
}

{ #category : #'as yet unclassified' }
CuentaCorriente >> descontarSaldo: unaCantidad [	 
	
	saldo := saldo - unaCantidad.
]

{ #category : #'as yet unclassified' }
CuentaCorriente >> obtenerMoneda [ 

	^ moneda
]

{ #category : #'as yet unclassified' }
CuentaCorriente >> printOn: aStream [	 
	
	aStream nextPutAll: 'Cuenta corriente numero '; 
	print: self obtenerNumeroDeCuenta; 
	nextPutAll: ' a nombre de ';
	nextPutAll: self obtenerCliente;
	nextPutAll: ' con moneda en ';
	nextPutAll: self obtenerMoneda;
	nextPutAll: ' y saldo ';
	print: self obtenerSaldo.
	
	
]
