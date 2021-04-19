Class {
	#name : #CuentaTest,
	#superclass : #TestCase,
	#category : #'Ejercicio1-test'
}

{ #category : #tests }
CuentaTest >> test01_ObtenerTodosLosClientesDeUnaColeccionDeCuentas [

	| unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2 |
	unaCuentaDeAhorro := CajaDeAhorro
		                     paraElCliente: 'Juan'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
	unaCuentaDeAhorro2 := CajaDeAhorro
		                      paraElCliente: 'Marcelo'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Pesos'.

	unaCuentaCorriente := CuentaCorriente
		                      paraElCliente: 'Maria'
		                      conElNumeroDeCuenta: 1
		                      conMoneda: 'Pesos'.
	unaCuentaCorriente2 := CuentaCorriente
		                       paraElCliente: 'Jose'
		                       conElNumeroDeCuenta: 2
		                       conMoneda: 'Pesos'.

	unaColeccionDeCuentas := OrderedCollection new
		                         add: unaCuentaDeAhorro;
		                         add: unaCuentaDeAhorro2;
		                         add: unaCuentaCorriente;
		                         add: unaCuentaCorriente2;
		                         yourself.

	self assert: unaColeccionDeCuentas size equals: 4.


	self
		assertCollection: (unaColeccionDeCuentas collect: [ :unaCuenta | 
				 unaCuenta obtenerCliente ])
		hasSameElements: #( 'Jose' 'Juan' 'Marcelo' 'Maria' )
]

{ #category : #tests }
CuentaTest >> test02_ObtenerTodasLasMonedas [

	| unaColeccionDeMonedas unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2 |
	unaCuentaDeAhorro := CajaDeAhorro
		                     paraElCliente: 'Juan'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
	unaCuentaDeAhorro2 := CajaDeAhorro
		                      paraElCliente: 'Marcelo'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Pesos'.

	unaCuentaCorriente := CuentaCorriente
		                      paraElCliente: 'Maria'
		                      conElNumeroDeCuenta: 1
		                      conMoneda: 'Dolares'.
	unaCuentaCorriente2 := CuentaCorriente
		                       paraElCliente: 'Jose'
		                       conElNumeroDeCuenta: 2
		                       conMoneda: 'Dolares'.

	unaColeccionDeCuentas := OrderedCollection new
		                         add: unaCuentaDeAhorro;
		                         add: unaCuentaDeAhorro2;
		                         add: unaCuentaCorriente;
		                         add: unaCuentaCorriente2;
		                         yourself.

	self assert: unaColeccionDeCuentas size equals: 4.

	unaColeccionDeMonedas := unaColeccionDeCuentas collect: [ :unaCuenta | 
		                         unaCuenta obtenerMoneda ].

	self
		assertCollection: unaColeccionDeMonedas
		hasSameElements: #( 'Pesos' 'Dolares' );
		assert: unaColeccionDeMonedas asSet size equals: 2
]

{ #category : #tests }
CuentaTest >> test05_EnviarDineroACuentaConDiferenteMoneda [

	| cuentaCorriente cajaDeAhorro |
	cuentaCorriente := CuentaCorriente
		                   paraElCliente: 'A'
		                   conElNumeroDeCuenta: 1
		                   conMoneda: 'Dolares'.
	cajaDeAhorro := CajaDeAhorro
		                paraElCliente: 'B'
		                conElNumeroDeCuenta: 2
		                conMoneda: 'Pesos'.

	self assert: cuentaCorriente obtenerMoneda equals: 'Dolares'.
	self assert: cajaDeAhorro obtenerMoneda equals: 'Pesos'.

	cuentaCorriente agregarSaldo: 50.

	self
		should: [ cuentaCorriente enviarDinero: 25 aCuenta: cajaDeAhorro ]
		raise: Exception
		withExceptionDo: [ :error |  ].
	self assert: cuentaCorriente obtenerSaldo equals: 50.
	self assert: cajaDeAhorro obtenerSaldo equals: 0
]

{ #category : #tests }
CuentaTest >> test06_DepositarDineroATodasLasCuentasYVerificar [

	| unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2 |
	unaCuentaDeAhorro := CajaDeAhorro
		                     paraElCliente: 'Juan'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
	unaCuentaDeAhorro2 := CajaDeAhorro
		                      paraElCliente: 'Marcelo'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Pesos'.

	unaCuentaCorriente := CuentaCorriente
		                      paraElCliente: 'Maria'
		                      conElNumeroDeCuenta: 1
		                      conMoneda: 'Pesos'.
	unaCuentaCorriente2 := CuentaCorriente
		                       paraElCliente: 'Jose'
		                       conElNumeroDeCuenta: 2
		                       conMoneda: 'Pesos'.

	unaColeccionDeCuentas := OrderedCollection new
		                         add: unaCuentaDeAhorro;
		                         add: unaCuentaDeAhorro2;
		                         add: unaCuentaCorriente;
		                         add: unaCuentaCorriente2;
		                         yourself.


	unaColeccionDeCuentas do: [ :unaCuenta | unaCuenta agregarSaldo: 500 ].

	unaColeccionDeCuentas do: [ :unaCuenta | 
		self assert: unaCuenta obtenerSaldo equals: 500 ]
]

{ #category : #tests }
CuentaTest >> test07_OrdernarCuentasPorSuNumeroDeIdentificacion [

	| numerosDeCuentaOrdenados unaColeccionDeCuentasOrdenadaPorSuNumeroDeIdentificacion  unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaDeAhorro3 |
	unaCuentaDeAhorro := CajaDeAhorro
		                     paraElCliente: 'Juan'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
	unaCuentaDeAhorro2 := CajaDeAhorro
		                      paraElCliente: 'Marcelo'
		                      conElNumeroDeCuenta: 7
		                      conMoneda: 'Pesos'.
	unaCuentaDeAhorro3 := CajaDeAhorro
		                      paraElCliente: 'Julieta'
		                      conElNumeroDeCuenta: 3
		                      conMoneda: 'Pesos'.

	unaColeccionDeCuentas := OrderedCollection new
		                         add: unaCuentaDeAhorro;
		                         add: unaCuentaDeAhorro3;
		                         add: unaCuentaDeAhorro2;
		                         yourself.

	unaColeccionDeCuentasOrdenadaPorSuNumeroDeIdentificacion  := unaColeccionDeCuentas  asSortedCollection: [ :unaCuenta :otraCuenta | unaCuenta obtenerNumeroDeCuenta < otraCuenta obtenerNumeroDeCuenta ].
	numerosDeCuentaOrdenados := unaColeccionDeCuentasOrdenadaPorSuNumeroDeIdentificacion  collect: [ :unaCuenta |  unaCuenta obtenerNumeroDeCuenta ].
	
	numerosDeCuentaOrdenados with:#(1 3 7)  do: [ :unNumeroDeCuenta :unNumeroDeCuentaEsperado | self assert: unNumeroDeCuenta equals:unNumeroDeCuentaEsperado  ].
]

{ #category : #tests }
CuentaTest >> test08_Depositar100PesosEnCuentasEnPesos [

	| unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2 unaColeccionDeCuentasEnPesos unaColeccionDeCuentasEnDolares|
	unaCuentaDeAhorro := CajaDeAhorro
		                     paraElCliente: 'Juan'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
	unaCuentaDeAhorro2 := CajaDeAhorro
		                      paraElCliente: 'Marcelo'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Dolares'.
		
	unaCuentaCorriente := CuentaCorriente 
		                     paraElCliente: 'Jose'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
	unaCuentaCorriente2 := CuentaCorriente 
		                      paraElCliente: 'Julieta'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Dolares'.	

	unaColeccionDeCuentas := OrderedCollection new
		                                 add: unaCuentaDeAhorro;
		                                 add: unaCuentaDeAhorro2;
												  add: unaCuentaCorriente;
												  add: unaCuentaCorriente2;  
		                                 yourself.

	unaColeccionDeCuentasEnPesos := unaColeccionDeCuentas select:[:unaCuenta | unaCuenta obtenerMoneda = 'Pesos' ].
	unaColeccionDeCuentasEnDolares := unaColeccionDeCuentas select:[:unaCuenta | unaCuenta obtenerMoneda = 'Dolares' ].
	
	
	unaColeccionDeCuentasEnPesos do: [ :unaCuenta | unaCuenta agregarSaldo: 100 ].
	
	unaColeccionDeCuentasEnPesos do: [ :unaCuenta | 	self assert: unaCuenta obtenerSaldo equals: 100 ].

		
]

{ #category : #tests }
CuentaTest >> test09_Depositar100DolaresEnCuentasEnDolares [

	| unaColeccionDeCuentas unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2 unaColeccionDeCuentasEnPesos unaColeccionDeCuentasEnDolares|
	unaCuentaDeAhorro := CajaDeAhorro
		                     paraElCliente: 'Juan'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
	unaCuentaDeAhorro2 := CajaDeAhorro
		                      paraElCliente: 'Marcelo'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Dolares'.
		
	unaCuentaCorriente := CuentaCorriente 
		                     paraElCliente: 'Jose'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
	unaCuentaCorriente2 := CuentaCorriente 
		                      paraElCliente: 'Julieta'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Dolares'.	

	unaColeccionDeCuentas := OrderedCollection new
		                                 add: unaCuentaDeAhorro;
		                                 add: unaCuentaDeAhorro2;
												  add: unaCuentaCorriente;
												  add: unaCuentaCorriente2;  
		                                 yourself.

	unaColeccionDeCuentasEnDolares := unaColeccionDeCuentas select:[:unaCuenta | unaCuenta obtenerMoneda = 'Dolares' ].
	
	unaColeccionDeCuentasEnDolares do: [ :unaCuenta | unaCuenta agregarSaldo: 50 ].
	
	unaColeccionDeCuentasEnDolares do: [ :unaCuenta | 	self assert: unaCuenta obtenerSaldo equals: 50 ].
		
]

{ #category : #tests }
CuentaTest >> test10_ComprobarCuentasConSaldoNegativo [

	| unaColeccionDeCuentas  unaCuentaCorriente unaCuentaCorriente2 unaCuentaCorriente3 unaColeccionDeCuentasConSaldoNegativo|
	
	unaCuentaCorriente := CuentaCorriente 
		                     paraElCliente: 'Jose'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
	unaCuentaCorriente2 := CuentaCorriente 
		                      paraElCliente: 'Julieta'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Dolares'.	
			
	unaCuentaCorriente3 := CuentaCorriente 
		                      paraElCliente: 'Mario'
		                      conElNumeroDeCuenta: 3
		                      conMoneda: 'Dolares'.	
	
	unaCuentaCorriente descontarSaldo: 50.
	unaCuentaCorriente2 descontarSaldo: 100.
	unaCuentaCorriente3 agregarSaldo: 100.

	unaColeccionDeCuentas := OrderedCollection new
		                                 add: unaCuentaCorriente;
												  add: unaCuentaCorriente3;  
												  add: unaCuentaCorriente2;                                  
												 yourself.
	
	self 
		assert: (unaColeccionDeCuentas anySatisfy:[:unaCuenta | unaCuenta tieneSaldoNegativo ]).
		
]

{ #category : #tests }
CuentaTest >> test11_SumaDeTodasLasCuentasEnDolares [

	| unaColeccionDeCuentas  unaCuentaCorriente unaCuentaCorriente2 unaCuentaCorriente3  unaSumaDeSaldosDeCuentas |

	unaCuentaCorriente := CuentaCorriente 
		                     paraElCliente: 'Jose'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Dolares'.
	unaCuentaCorriente2 := CuentaCorriente 
		                      paraElCliente: 'Julieta'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Dolares'.	
			
	unaCuentaCorriente3 := CuentaCorriente 
		                      paraElCliente: 'Mario'
		                      conElNumeroDeCuenta: 3
		                      conMoneda: 'Dolares'.	
	
	unaCuentaCorriente agregarSaldo: 50.
	unaCuentaCorriente2 descontarSaldo: 100.
	unaCuentaCorriente3 agregarSaldo: 20.

	unaColeccionDeCuentas := OrderedCollection new
		                                 add: unaCuentaCorriente;
												  add: unaCuentaCorriente3;  
												  add: unaCuentaCorriente2;                                  
												 yourself.
	unaSumaDeSaldosDeCuentas := unaColeccionDeCuentas inject: 0 into:[:sumaParcial :unaCuenta| sumaParcial + unaCuenta obtenerSaldo ]. 
	unaSumaDeSaldosDeCuentas := (unaColeccionDeCuentas collect:[:unaCuenta | unaCuenta obtenerSaldo ])   sumNumbers.
	unaSumaDeSaldosDeCuentas := unaColeccionDeCuentas sumNumbers:[:unaCuenta| unaCuenta obtenerSaldo ]. 
	unaSumaDeSaldosDeCuentas := unaColeccionDeCuentas sumNumbers: #obtenerSaldo. 
	
	self 
		assert: unaSumaDeSaldosDeCuentas equals: -30.	
]

{ #category : #tests }
CuentaTest >> test_10AgruparCuentasPorTipoDeMoneda [

| unaCuentaDeAhorro unaCuentaDeAhorro2 unaCuentaCorriente unaCuentaCorriente2 unaColeccionDeCuentas unDiccionarioDeCuentas|
	unaCuentaDeAhorro := CajaDeAhorro
		                     paraElCliente: 'Juan'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
	unaCuentaDeAhorro2 := CajaDeAhorro
		                      paraElCliente: 'Marcelo'
		                      conElNumeroDeCuenta: 2
		                      conMoneda: 'Dolares'.
		
	unaCuentaCorriente := CuentaCorriente 
		                     paraElCliente: 'Jose'
		                     conElNumeroDeCuenta: 1
		                     conMoneda: 'Pesos'.
							 
	unaColeccionDeCuentas := Array with: unaCuentaDeAhorro with: unaCuentaDeAhorro2  with: unaCuentaCorriente  with: unaCuentaCorriente2 .
	unDiccionarioDeCuentas := Dictionary new.
	unaColeccionDeCuentas do: [:unaCuenta | unDiccionarioDeCuentas at: unaCuenta obtenerMoneda 
		ifPresent: [:valor | valor add: unaCuenta]
		ifAbsentPut: [OrderedCollection  with: unaCuenta]].
	
	
	self assertCollection: unDiccionarioDeCuentas  keys hasSameElements: #('Pesos' 'Dolares').
	
	unDiccionarioDeCuentas := unaColeccionDeCuentas  groupedBy: [ :unaCuenta | unaCuenta obtenerMoneda ].
	
	self assertCollection: unDiccionarioDeCuentas  keys hasSameElements: #('Pesos' 'Dolares').
	
	unDiccionarioDeCuentas := unaColeccionDeCuentas  groupedBy: #obtenerMoneda.
	
	self assertCollection: unDiccionarioDeCuentas  keys hasSameElements: #('Pesos' 'Dolares').
	
	"Implementar el mismo comportamiento con inject"
	
]
