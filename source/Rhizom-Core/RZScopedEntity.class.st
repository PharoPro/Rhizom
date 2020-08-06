Class {
	#name : #RZScopedEntity,
	#superclass : #Object,
	#instVars : [
		'scope'
	],
	#category : #'Rhizom-Core-Model'
}

{ #category : #accessing }
RZScopedEntity >> scope [
	^ scope
]

{ #category : #accessing }
RZScopedEntity >> scope: anObject [
	scope := anObject
]
