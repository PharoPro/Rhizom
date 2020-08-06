Class {
	#name : #RZBaselineProjectRequirement,
	#superclass : #RZProjectRequirement,
	#instVars : [
		'repository',
		'loads'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #initialization }
RZBaselineProjectRequirement >> initialize [ 
	super initialize.
	loads := OrderedCollection new
]

{ #category : #'as yet unclassified' }
RZBaselineProjectRequirement >> loads: aCollection [ 
	loads := aCollection
]

{ #category : #'as yet unclassified' }
RZBaselineProjectRequirement >> name: aString [ 
	name := aString
]

{ #category : #copying }
RZBaselineProjectRequirement >> postCopy [ 
	repository := repository copy.
	loads := loads copy
]

{ #category : #printing }
RZBaselineProjectRequirement >> printOn: aStream [
	aStream << 'requires: ' << (name ifNil: ['N/A']) << '(' << ($, join: loads) << ')' << ' {'.
	scope printOn: aStream.
	aStream << '}'
]

{ #category : #'as yet unclassified' }
RZBaselineProjectRequirement >> repository: aString [ 
	self halt.
	repository := aString
]

{ #category : #'as yet unclassified' }
RZBaselineProjectRequirement >> repositoryUrlString: aString [ 
	repository := RZRepositoryLocator urlFromString: aString
]
