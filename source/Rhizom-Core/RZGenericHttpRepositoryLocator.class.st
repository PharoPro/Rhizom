Class {
	#name : #RZGenericHttpRepositoryLocator,
	#superclass : #RZHttpRepositoryLocator,
	#category : #'Rhizom-Core-Repository'
}

{ #category : #'as yet unclassified' }
RZGenericHttpRepositoryLocator class >> matchesHostname: aString [ 
	^ false
]

{ #category : #'as yet unclassified' }
RZGenericHttpRepositoryLocator >> url: aZnUrl [ 
	url := aZnUrl 
]
