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

{ #category : #printing }
RZBaselineProjectRequirement >> printOn: aStream [
	aStream << 'requires: ' << (name ifNil: ['N/A']) << '(' << ($, join: loads) << ')'
]

{ #category : #'as yet unclassified' }
RZBaselineProjectRequirement >> repository: aString [ 
	repository := aString
]
