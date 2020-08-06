Class {
	#name : #RZRepositoryLocator,
	#superclass : #Object,
	#category : #'Rhizom-Core-Repository'
}

{ #category : #testing }
RZRepositoryLocator class >> matchesScheme: aString [
	^ self schemeName = aString
]

{ #category : #'as yet unclassified' }
RZRepositoryLocator class >> urlFromString: aString [ 
	| stream scheme handlerClass |
	scheme := aString readStream upTo: $:.
	handlerClass := self allSubclasses 
		detect: [ :each | each matchesScheme: scheme ]
		ifNone: [ RZHandlerNotFound signal: 'No handler found for scheme ', scheme asString ].
	^ handlerClass fromString: aString
]
