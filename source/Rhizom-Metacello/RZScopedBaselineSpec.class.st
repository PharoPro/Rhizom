Class {
	#name : #RZScopedBaselineSpec,
	#superclass : #RZScopedSpec,
	#instVars : [
		'packages',
		'requirements'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZScopedBaselineSpec >> addPackage: aString [ 
	self packages add: aString
]

{ #category : #initialization }
RZScopedBaselineSpec >> initialize [ 
	super initialize.
	requirements := Dictionary new.
	packages := Set new
]

{ #category : #'as yet unclassified' }
RZScopedBaselineSpec >> packages [
	^ packages ifNil: [ 
		packages := Set new ]
]

{ #category : #'as yet unclassified' }
RZScopedBaselineSpec >> requirementAt: aString [ 
	^ requirements at: aString
]

{ #category : #'as yet unclassified' }
RZScopedBaselineSpec >> requirementAt: aString put: aRequirement [ 
	(requirements includesKey: aString) ifTrue: [ 
		Error signal: 'Requirement ', aString, ' is already added' ].
	requirements
		at: aString 
		put: aRequirement 
]
