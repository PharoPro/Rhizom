Class {
	#name : #RZHttpHandler,
	#superclass : #RZUrlHandler,
	#instVars : [
		'url'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZHttpHandler class >> fromString: aString [ 
	| url httpRepositoryClass |
	url := aString asZnUrl.
	httpRepositoryClass := self allSubclasses 
		detect: [ :each | each matchesHostname: url host ]
		ifNone: [ RZGenericHttpRepository ].
	^ httpRepositoryClass new
		url: url
]

{ #category : #testing }
RZHttpHandler class >> matchesScheme: aString [
	^ #( http https ) includes: aString
]

{ #category : #'as yet unclassified' }
RZHttpHandler >> initializeFrom: aString [ 
	url := aString asZnUrl.
]
