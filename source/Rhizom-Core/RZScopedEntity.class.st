Class {
	#name : #RZScopedEntity,
	#superclass : #Object,
	#instVars : [
		'scope'
	],
	#category : #'Rhizom-Core-Model'
}

{ #category : #'as yet unclassified' }
RZScopedEntity >> includesScope: aString [
	(scope isNil or: [ scope = #common ]) ifTrue: [ 
		^ true ].
	^ scope includes: aString
]

{ #category : #'as yet unclassified' }
RZScopedEntity >> includesScopes: aCollection [ 
	^ aCollection allSatisfy: [ :each |
		self includesScope: each  ]
]

{ #category : #accessing }
RZScopedEntity >> scope [
	^ scope
]

{ #category : #accessing }
RZScopedEntity >> scope: anObject [
	scope := anObject
]
