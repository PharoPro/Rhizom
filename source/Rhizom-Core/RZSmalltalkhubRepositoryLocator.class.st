Class {
	#name : #RZSmalltalkhubRepositoryLocator,
	#superclass : #RZHttpRepositoryLocator,
	#category : #'Rhizom-Core'
}

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator class >> matchesHostname: aString [ 
	^ { 'smalltalkhub.com' . 'www.smalltalkhub.com' } includes: aString
]
