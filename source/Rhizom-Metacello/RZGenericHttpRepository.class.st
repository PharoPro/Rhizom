Class {
	#name : #RZGenericHttpRepository,
	#superclass : #RZHttpHandler,
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZGenericHttpRepository class >> matchesHostname: aString [ 
	^ false
]

{ #category : #'as yet unclassified' }
RZGenericHttpRepository >> url: aZnUrl [ 
	url := aZnUrl 
]
