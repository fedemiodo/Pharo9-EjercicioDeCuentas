Class {
	#name : #CajaDeAhorroTest,
	#superclass : #TestCase,
	#instVars : [
		'cajaDeAhorro'
	],
	#category : #'Ejercicio1-test'
}

{ #category : #tests }
CajaDeAhorroTest >> testAgregarSaldoAInstancia [
| cajaDeAhorro |
cajaDeAhorro := CajaDeAhorro new.
cajaDeAhorro agregarSaldo: 5.
self assert: cajaDeAhorro obtenerSaldo equals: 5.
]

{ #category : #tests }
CajaDeAhorroTest >> testAgregarYDescontarSaldoMuchasVeces [
cajaDeAhorro := CajaDeAhorro new.
self assert: cajaDeAhorro obtenerSaldo  equals: 0.
cajaDeAhorro agregarSaldo: 24.
self assert: cajaDeAhorro obtenerSaldo  equals: 24.
cajaDeAhorro descontarSaldo: 17.
self assert: cajaDeAhorro obtenerSaldo  equals: 24 - 17.
]

{ #category : #tests }
CajaDeAhorroTest >> testCreacionInstanciaSinSaldo [ 
| cajaDeAhorro | 
cajaDeAhorro := CajaDeAhorro new.
self assert: cajaDeAhorro obtenerSaldo equals: 0.
]

{ #category : #tests }
CajaDeAhorroTest >> testDescontarSaldoACajaDeAhorro [
cajaDeAhorro := CajaDeAhorro new.

self assert: cajaDeAhorro obtenerSaldo  equals: 0.
self should: [ cajaDeAhorro descontarSaldo: 10. ] raise: Exception  withExceptionDo: [ :error |  ].
self assert: cajaDeAhorro obtenerSaldo  equals: 0.
]

{ #category : #tests }
CajaDeAhorroTest >> testEnviarDineroAOtraCajaYVerificarSaldos [
| cajaDeAhorro1 cajaDeAhorro2 |
cajaDeAhorro1 := CajaDeAhorro new.
cajaDeAhorro1 agregarSaldo: 50.
cajaDeAhorro2 := CajaDeAhorro new.
cajaDeAhorro1 enviarDinero: 25 aCuenta: cajaDeAhorro2.
self assert: cajaDeAhorro1 obtenerSaldo  equals: 25.
self assert: cajaDeAhorro2 obtenerSaldo  equals: 25.
]
