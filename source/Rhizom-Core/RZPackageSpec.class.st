Class {
	#name : #RZPackageSpec,
	#superclass : #RZScopedEntity,
	#instVars : [
		'name',
		'requires'
	],
	#category : #'Rhizom-Core-Model'
}

{ #category : #'as yet unclassified' }
RZPackageSpec class >> named: aString [ 
	^ self new
		name: aString
]

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
