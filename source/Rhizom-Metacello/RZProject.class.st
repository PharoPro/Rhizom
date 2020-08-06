Class {
	#name : #RZProject,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZProject class >> named: aString [ 
	^ self new
		name: aString
]

{ #category : #'as yet unclassified' }
RZProject >> name: aString [ 
	name := aString
]

{ #category : #printing }
RZProject >> printOn: aStream [

	aStream << 'Project: ' << name
]
