Class {
	#name : #BaselineOfCuenta,
	#superclass : #BaselineOf,
	#category : #BaselineOfCuenta
}

{ #category : #baselines }
BaselineOfCuenta >> baseline: spec [
	<baseline>
	spec for: #pharo do: [ 
		spec
			package: 'Ejercicio1-model';
			package: 'Ejercicio1-test'
			with: [ spec requires: #( 'Ejercicio1-model') ] ]
]

{ #category : #baselines }
BaselineOfCuenta >> projectClass [
	^ MetacelloCypressBaselineProject
]
