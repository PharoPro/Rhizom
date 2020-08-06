Class {
	#name : #RZBaselinePackageSpec,
	#superclass : #RZPackageSpec,
	#instVars : [
		'requires'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZBaselinePackageSpec >> name: aString [ 
	name := aString
]

{ #category : #'as yet unclassified' }
RZBaselinePackageSpec >> requires: aCollection [ 
	requires := aCollection
]
