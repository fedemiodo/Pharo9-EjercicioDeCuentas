Class {
	#name : #BaselineOfCuenta,
	#superclass : #BaselineOf,
	#category : #BaselineOfCuenta
}

{ #category : #baselines }
BaselineOfCuenta >> baseline: spec [

	<baseline>
	self setUpDependencies: spec.
	self setUpPackages: spec
]

{ #category : #baselines }
BaselineOfCuenta >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #initialization }
BaselineOfCuenta >> setUpDependencies: spec [

spec baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6/source' ]

]

{ #category : #baselines }
BaselineOfCuenta >> setUpPackages: spec [

	spec for: #pharo do: [ 
		spec
			package: 'Ejercicio1-model' with: [ spec requires: 'Buoy' ];
			package: 'Ejercicio1-test'	with: [ spec requires: #( 'Ejercicio1-model' ) ] ]
]
