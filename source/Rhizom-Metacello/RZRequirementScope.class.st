Class {
	#name : #RZRequirementScope,
	#superclass : #Object,
	#instVars : [
		'attributes'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZRequirementScope >> addAttribute: aString [ 
	attributes add: aString
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
