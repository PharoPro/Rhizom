Class {
	#name : #RZProjectRequirement,
	#superclass : #RZScopedEntity,
	#instVars : [
		'name',
		'version',
		'repository',
		'views'
	],
	#category : #'Rhizom-Core-Model'
}

{ #category : #'as yet unclassified' }
RZProjectRequirement >> name [
	^ name
]

{ #category : #'as yet unclassified' }
RZProjectRequirement >> name: aString [ 
	name := aString 
]

{ #category : #copying }
RZProjectRequirement >> postCopy [ 
	repository := repository copy. 
	views := views copy
]

{ #category : #printing }
RZProjectRequirement >> printOn: aStream [
	aStream << 'requires: ' << (name ifNil: ['N/A']) .
	views ifNotNil: [  
		aStream << '(' << ($, join: views) << ')' ].
	aStream << ' {'.
	scope printOn: aStream.
	aStream << '}' 
]

{ #category : #'as yet unclassified' }
RZProjectRequirement >> repository [
	^ repository
]

{ #category : #'as yet unclassified' }
RZProjectRequirement >> repositoryUrlString: aString [ 
	repository := RZRepositoryLocator urlFromString: aString 
]

{ #category : #accessing }
RZProjectRequirement >> scope: aString [ 
	aString isString ifTrue: [ self halt ].
	^ super scope: aString
]

{ #category : #'as yet unclassified' }
RZProjectRequirement >> version: aString [ 
	version := aString
]

{ #category : #accessing }
RZProjectRequirement >> views [
	^ views 
]

{ #category : #accessing }
RZProjectRequirement >> views: anObject [
	views := anObject 
]
