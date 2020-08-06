Class {
	#name : #RZProject,
	#superclass : #Object,
	#instVars : [
		'name',
		'packages'
	],
	#category : #'Rhizom-Core-Model'
}

{ #category : #'as yet unclassified' }
RZProject class >> named: aString [ 
	^ self new
		name: aString
]

{ #category : #'as yet unclassified' }
RZProject >> addPackage: aRZPackageSpec [ 
	packages add: aRZPackageSpec 
]

{ #category : #initialization }
RZProject >> initialize [ 
	super initialize.
	packages := Set new.

]

{ #category : #'as yet unclassified' }
RZProject >> name: aString [ 
	name := aString
]

{ #category : #printing }
RZProject >> printOn: aStream [

	aStream << 'Project: ' << name
]
