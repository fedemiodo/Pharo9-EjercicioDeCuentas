Class {
	#name : #CuentaTest,
	#superclass : #TestCase,
	#category : #'Ejercicio1-test'
}

{ #category : #tests }
CuentaTest >> test01_ObtenerTodosLosClientesDeUnaColeccionDeCuentas [

	|unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2|
	
	unaCuentaDeAhorro := CajaDeAhorro paraElCliente: 'Juan' conElNumeroDeCuenta: 1 .
	unaCuentaDeAhorro2 := CajaDeAhorro paraElCliente: 'Marcelo' conElNumeroDeCuenta: 2 .
	
	unaCuentaCorriente  := CuentaCorriente  paraElCliente: 'Maria' conElNumeroDeCuenta: 1 .	
	unaCuentaCorriente2  := CuentaCorriente  paraElCliente: 'Jose' conElNumeroDeCuenta: 2 .	
	
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
	
	unaCuentaDeAhorro := CajaDeAhorro paraElCliente: 'Juan' conElNumeroDeCuenta: 1 .
	unaCuentaDeAhorro2 := CajaDeAhorro paraElCliente: 'Marcelo' conElNumeroDeCuenta: 2 .
	
	unaCuentaCorriente  := CuentaCorriente  paraElCliente: 'Maria' conElNumeroDeCuenta: 1 .	
	unaCuentaCorriente2  := CuentaCorriente  paraElCliente: 'Jose' conElNumeroDeCuenta: 2 .	
	
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

cuentaCorriente := CuentaCorriente paraElCliente: 'A' conElNumeroDeCuenta: 1 .
cajaDeAhorro := CajaDeAhorro paraElCliente: 'B' conElNumeroDeCuenta: 2 .

self assert: cuentaCorriente obtenerMoneda  equals: 'Dolares'.
self assert: cajaDeAhorro  obtenerMoneda  equals: 'Pesos'.

cuentaCorriente agregarSaldo: 50.

self should: [ cuentaCorriente enviarDinero: 25 aCuenta: cajaDeAhorro. ] raise: Exception  withExceptionDo: [ :error | ]. 
self assert: cuentaCorriente obtenerSaldo  equals: 50.
self assert: cajaDeAhorro obtenerSaldo  equals: 0.
]

{ #category : #tests }
CuentaTest >> test06_DepositarDineroATodasLasCuentasYVerificar [

	| unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2 |
	unaCuentaDeAhorro := CajaDeAhorro paraElCliente: 'Juan' conElNumeroDeCuenta: 1 .
	unaCuentaDeAhorro2 := CajaDeAhorro paraElCliente: 'Marcelo' conElNumeroDeCuenta: 2 .

	unaCuentaCorriente := CuentaCorriente paraElCliente: 'Maria' conElNumeroDeCuenta: 1 .
	unaCuentaCorriente2 := CuentaCorriente paraElCliente: 'Jose' conElNumeroDeCuenta: 2 .

	unaColeccionDeCuentas := OrderedCollection new
		                         add: unaCuentaDeAhorro;
		                         add: unaCuentaDeAhorro2;
		                         add: unaCuentaCorriente;
		                         add: unaCuentaCorriente2;
		                         yourself.


	unaColeccionDeCuentas do: [ :unaCuenta | unaCuenta agregarSaldo: 500 ].

	unaColeccionDeCuentas do: [ :unaCuenta | self assert: unaCuenta obtenerSaldo  equals: 500 ].
]

{ #category : #tests }
CuentaTest >> test07_OrdernarCuentasPorSuNumeroDeIdentificacion [

	| unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaDeAhorro3 |
	unaCuentaDeAhorro := CajaDeAhorro paraElCliente: 'Juan' conElNumeroDeCuenta: 1 .
	unaCuentaDeAhorro2 := CajaDeAhorro paraElCliente: 'Marcelo' conElNumeroDeCuenta: 7 .
	unaCuentaDeAhorro3 := CajaDeAhorro paraElCliente: 'Julieta' conElNumeroDeCuenta: 3 .

	unaColeccionDeCuentas := OrderedCollection  new
			   add: unaCuentaDeAhorro;
				add: unaCuentaDeAhorro3; 
		      add: unaCuentaDeAhorro2;
		      yourself.

	unaColeccionDeCuentas asSortedCollection: [:unaCuenta :otraCuenta | unaCuenta obtenerNumeroDeCuenta  < otraCuenta obtenerNumeroDeCuenta].
		
	self assertCollection: (unaColeccionDeCuentas collect:[:unaCuenta | unaCuenta obtenerNumeroDeCuenta  ]) hasSameElements: #(1 3 7).
]
