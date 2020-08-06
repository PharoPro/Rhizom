Class {
	#name : #RZSmalltalkhubRepositoryLocator,
	#superclass : #RZHttpRepositoryLocator,
	#category : #'Rhizom-Core-Repository'
}

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator class >> matchesHostname: aString [ 
	^ { 'smalltalkhub.com' . 'www.smalltalkhub.com' } includes: aString
]
