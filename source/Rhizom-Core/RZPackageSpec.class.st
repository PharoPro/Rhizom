Class {
	#name : #RZPackageSpec,
	#superclass : #Object,
	#instVars : [
		'name',
		'requires'
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

{ #category : #'as yet unclassified' }
RZPackageSpec >> requires: aCollection [ 
	requires := aCollection
]
