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
	views := Dictionary new.
	requirements := Dictionary new.
]

{ #category : #'as yet unclassified' }
RZProject >> name: aString [ 
	name := aString
]

{ #category : #printing }
RZProject >> printOn: aStream [

	aStream << 'Project: ' << name
]

{ #category : #accessing }
RZProject >> requirementAt: aString [ 
	^ requirements at: aString
]

{ #category : #accessing }
RZProject >> requirementAt: aString put: aRequirement [ 
	requirements at: aString put: aRequirement 
]

{ #category : #'as yet unclassified' }
RZProject >> requirements [
	^ requirements
]

{ #category : #accessing }
RZProject >> viewAt: aString put: aCollection [ 
	views 
		at: aString 
		put: aCollection
]
