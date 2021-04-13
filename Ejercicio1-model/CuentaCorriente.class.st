Class {
	#name : #CuentaCorriente,
	#superclass : #Cuenta,
	#category : #'Ejercicio1-model'
}

{ #category : #'as yet unclassified' }
CuentaCorriente >> descontarSaldo: unaCantidad [	 
	saldo := saldo - unaCantidad.
]
