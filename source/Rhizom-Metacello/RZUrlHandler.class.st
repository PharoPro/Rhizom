Class {
	#name : #RZUrlHandler,
	#superclass : #Object,
	#category : #'Rhizom-Metacello'
}

{ #category : #testing }
RZUrlHandler class >> matchesScheme: aString [
	^ self schemeName = aString
]

{ #category : #'as yet unclassified' }
RZUrlHandler class >> urlFromString: aString [ 
	| stream scheme handlerClass |
	scheme := aString readStream upTo: $:.
	handlerClass := self allSubclasses 
		detect: [ :each | each matchesScheme: scheme ]
		ifNone: [ RZHandlerNotFound signal: 'No handler found for scheme ', scheme asString ].
	^ handlerClass fromString: aString
]
