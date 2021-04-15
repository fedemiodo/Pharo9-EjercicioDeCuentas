Class {
	#name : #CuentaTest,
	#superclass : #TestCase,
	#category : #'Ejercicio1-test'
}

{ #category : #tests }
CuentaTest >> test01_ObtenerTodosLosClientesDeUnaColeccionDeCuentas [

	|unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2|
	
	unaCuentaDeAhorro := CajaDeAhorro paraElCliente: 'Juan'.
	unaCuentaDeAhorro2 := CajaDeAhorro paraElCliente: 'Marcelo'.
	
	unaCuentaCorriente  := CuentaCorriente  paraElCliente: 'Maria'.	
	unaCuentaCorriente2  := CuentaCorriente  paraElCliente: 'Jose'.	
	
	unaColeccionDeCuentas:= OrderedCollection new
		add: unaCuentaDeAhorro ;
		add: unaCuentaDeAhorro2 ;
		add: unaCuentaCorriente ;
		add: unaCuentaCorriente2; 
		yourself.
	
	self assert: unaColeccionDeCuentas size equals: 4.
	
	
	self assertCollection: (unaColeccionDeCuentas collect: [ :unaCuenta | unaCuenta obtenerCliente ])    hasSameElements: #('Jose' 'Juan' 'Marcelo' 'Maria' ).
	 
	
	
	

]

{ #category : #tests }
CuentaTest >> test02_ObtenerTodasLasMonedas [

	|unaColeccionDeMonedas unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2|
	
	unaCuentaDeAhorro := CajaDeAhorro paraElCliente: 'Juan'.
	unaCuentaDeAhorro2 := CajaDeAhorro paraElCliente: 'Marcelo'.
	
	unaCuentaCorriente  := CuentaCorriente  paraElCliente: 'Maria'.	
	unaCuentaCorriente2  := CuentaCorriente  paraElCliente: 'Jose'.	
	
	unaColeccionDeCuentas:= OrderedCollection  new
		add: unaCuentaDeAhorro ;
		add: unaCuentaDeAhorro2 ;
		add: unaCuentaCorriente ;
		add: unaCuentaCorriente2; 
		yourself.
	
	self assert: unaColeccionDeCuentas size equals: 4.
	
	unaColeccionDeMonedas := (unaColeccionDeCuentas collect: [ :unaCuenta | unaCuenta obtenerMoneda ]).
	
	self assertCollection: unaColeccionDeMonedas    hasSameElements: #('Pesos' 'Dolares');
		  assert: unaColeccionDeMonedas asSet size equals: 2. 
	 
	
	
	

]

{ #category : #tests }
CuentaTest >> test05_EnviarDineroACuentaConDiferenteMoneda [

| cuentaCorriente cajaDeAhorro  |

cuentaCorriente := CuentaCorriente paraElCliente: 'A'.
cajaDeAhorro := CajaDeAhorro paraElCliente: 'B'.

self assert: cuentaCorriente obtenerMoneda  equals: 'Dolares'.
self assert: cajaDeAhorro  obtenerMoneda  equals: 'Pesos'.

cuentaCorriente agregarSaldo: 50.

self should: [ cuentaCorriente enviarDinero: 25 aCuenta: cajaDeAhorro. ] raise: Exception  withExceptionDo: [ :error | ]. 
self assert: cuentaCorriente obtenerSaldo  equals: 50.
self assert: cajaDeAhorro obtenerSaldo  equals: 0.
]

{ #category : #tests }
CuentaTest >> test11_DepositarDineroATodasLasCuentasYVerificar [

	| unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2 |
	unaCuentaDeAhorro := CajaDeAhorro paraElCliente: 'Juan'.
	unaCuentaDeAhorro2 := CajaDeAhorro paraElCliente: 'Marcelo'.

	unaCuentaCorriente := CuentaCorriente paraElCliente: 'Maria'.
	unaCuentaCorriente2 := CuentaCorriente paraElCliente: 'Jose'.

	unaColeccionDeCuentas := OrderedCollection new
		                         add: unaCuentaDeAhorro;
		                         add: unaCuentaDeAhorro2;
		                         add: unaCuentaCorriente;
		                         add: unaCuentaCorriente2;
		                         yourself.


	unaColeccionDeCuentas do: [ :unaCuenta | unaCuenta agregarSaldo: 500 ].

	unaColeccionDeCuentas do: [ :unaCuenta | self assert: unaCuenta obtenerSaldo  equals: 500 ].
]
