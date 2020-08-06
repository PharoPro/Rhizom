Class {
	#name : #RZPackageSpec,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Rhizom-Core'
}

{ #category : #'as yet unclassified' }
RZPackageSpec >> name: aString [ 
	name := aString
]

{ #category : #printing }
RZPackageSpec >> printOn: aStream [

	aStream << 'PackageSpec:' << name
]
