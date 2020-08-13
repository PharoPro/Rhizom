Class {
	#name : #RZProject,
	#superclass : #Object,
	#instVars : [
		'name',
		'packages',
		'views',
		'requirements'
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

{ #category : #'as yet unclassified' }
RZProject >> asScoped: aCollection [ 
	| scoped |
	scoped := self class new.
	scoped name: name.
	scoped packages: (packages select: [:each | each includesScopes: aCollection ]).
	scoped views: views.
	scoped requirements: (requirements select: [:each | each includesScopes: aCollection ]).
	^ scoped
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

{ #category : #'as yet unclassified' }
RZProject >> packages: aCollection [ 
	packages := aCollection
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

{ #category : #'as yet unclassified' }
RZProject >> requirements: aCollection [ 
	requirements := aCollection
]

{ #category : #'as yet unclassified' }
RZProject >> scoped: aCollection [ 
	^ aCollection select: [ :each |
		each includesScopes: aCollection ]
]

{ #category : #accessing }
RZProject >> viewAt: aString put: aCollection [ 
	views 
		at: aString 
		put: aCollection
]

{ #category : #'as yet unclassified' }
RZProject >> views: aCollection [ 
	views := aCollection
]
