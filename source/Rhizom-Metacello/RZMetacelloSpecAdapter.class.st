Class {
	#name : #RZMetacelloSpecAdapter,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZMetacelloSpecAdapter >> currentScope [

	^ RZCurrentScope value
]

{ #category : #visiting }
RZMetacelloSpecAdapter >> group: aName with: aCollection [
	project
		viewAt: aName 
		put: aCollection
]

{ #category : #'as yet unclassified' }
RZMetacelloSpecAdapter >> project [
	^ project
]

{ #category : #enumerating }
RZMetacelloSpecAdapter >> with: attributes do: aBlock [

	^ RZCurrentScope 
		value: attributes 
		during: aBlock
]
