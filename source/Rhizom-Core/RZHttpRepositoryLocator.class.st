Class {
	#name : #RZHttpRepositoryLocator,
	#superclass : #RZRepositoryLocator,
	#instVars : [
		'url'
	],
	#category : #'Rhizom-Core-Repository'
}

{ #category : #'as yet unclassified' }
RZHttpRepositoryLocator class >> fromString: aString [ 
	| url httpRepositoryClass |
	url := aString asZnUrl.
	httpRepositoryClass := self allSubclasses 
		detect: [ :each | each matchesHostname: url host ]
		ifNone: [ RZGenericHttpRepositoryLocator ].
	^ httpRepositoryClass new
		url: url
]

{ #category : #testing }
RZHttpRepositoryLocator class >> matchesScheme: aString [
	^ #( http https ) includes: aString
]

{ #category : #'as yet unclassified' }
RZHttpRepositoryLocator >> initializeFrom: aString [ 
	url := aString asZnUrl.
]

{ #category : #printing }
RZHttpRepositoryLocator >> printOn: aStream [
	url printOn: aStream
]

{ #category : #'as yet unclassified' }
RZHttpRepositoryLocator >> url: aZnUrl [ 
	url := aZnUrl
]
