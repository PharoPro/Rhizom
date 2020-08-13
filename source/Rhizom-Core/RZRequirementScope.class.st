Class {
	#name : #RZRequirementScope,
	#superclass : #Object,
	#instVars : [
		'attributes'
	],
	#category : #'Rhizom-Core-Model'
}

{ #category : #'as yet unclassified' }
RZRequirementScope >> addAttribute: aString [ 
	attributes add: aString
]

{ #category : #'as yet unclassified' }
RZRequirementScope >> includes: aString [
	| s |
	s := ((attributes includes: 'MacOS') | (attributes includes: 'Unix') | (attributes includes: 'pharo8.x') | (attributes includes: 'common')) & (attributes includes: 'Windows') not.
	^s
]

{ #category : #initialization }
RZRequirementScope >> initialize [ 
	super initialize.
	attributes := Set new
]

{ #category : #'as yet unclassified' }
RZRequirementScope >> newScopeWith: aString [ 
	^ self copy
		addAttribute: aString;
		yourself
]

{ #category : #copying }
RZRequirementScope >> postCopy [ 
	attributes := attributes copy
]

{ #category : #printing }
RZRequirementScope >> printOn: aStream [
	aStream << 'scope: ' << ($, join: attributes) 
]
