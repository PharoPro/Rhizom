Class {
	#name : #RZProjectRequirement,
	#superclass : #Object,
	#instVars : [
		'name',
		'scope',
		'version'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #accessing }
RZProjectRequirement >> scope [
	^ scope
]

{ #category : #accessing }
RZProjectRequirement >> scope: anObject [
	scope := anObject
]

{ #category : #'as yet unclassified' }
RZProjectRequirement >> version: aString [ 
	version := aString
]
