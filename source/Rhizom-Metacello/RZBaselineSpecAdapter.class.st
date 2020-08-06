"
I'm a visitor for Metacello Baselines.
I build a Pakbot project from the information I get from the baseline.
The project will not be registered in the default registry but in a new one created for the context of this visitor.
"
Class {
	#name : #RZBaselineSpecAdapter,
	#superclass : #RZMetacelloSpecAdapter,
	#instVars : [
		'projectDependencyProperties',
		'project',
		'currentRequirement',
		'packages',
		'requirements',
		'views'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> addPackage: aRZBaselinePackageSpec [ 
	packages add: aRZBaselinePackageSpec 
]

{ #category : #visiting }
RZBaselineSpecAdapter >> baseline: aName with: aBlockClosure [ 
	currentRequirement := self projectRequirementFor: aName.
	[ aBlockClosure value.
		self 
			requirementAt: aName 
			put: currentRequirement ]
		ensure: [ currentRequirement := nil ].

]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> blessing: aString [ 
	"ignore"
]

{ #category : #visiting }
RZBaselineSpecAdapter >> className: aString [ 
	"class name of the ConfigurationOf
	ignored for now."
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> configuration: aString with: aBlockClosure [ 
	currentRequirement := self projectRequirementFor: aString.
	[ aBlockClosure value.
		self 
			requirementAt: aString 
			put: currentRequirement ]
		ensure: [ currentRequirement := nil ].

]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> description: aString [ 
	"ignore"
]

{ #category : #visiting }
RZBaselineSpecAdapter >> for: attribute do: aBlockClosure [ 
	^ self 
		with: (self newScopeWith: attribute)
		do: aBlockClosure 
	
]

{ #category : #visiting }
RZBaselineSpecAdapter >> group: aName with: aCollection [
	self
		viewAt: aName 
		put: aCollection
]

{ #category : #api }
RZBaselineSpecAdapter >> import: spec [
	"ignore"
]

{ #category : #initialization }
RZBaselineSpecAdapter >> initialize [ 
	super initialize.
	requirements := Dictionary new.
	packages := Set new.
	views := Dictionary new.
]

{ #category : #visiting }
RZBaselineSpecAdapter >> loads: parts [ 
	currentRequirement loads: (parts isString 
		ifTrue: [ Array with: parts ]
		ifFalse: [ parts ])
]

{ #category : #visiting }
RZBaselineSpecAdapter >> newScopeWith: attribute [
	^ self currentScope newScopeWith: attribute
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> package: aString [ 
	self addPackage: aString
]

{ #category : #visiting }
RZBaselineSpecAdapter >> package: aName with: aBlockClosure [ 
	currentRequirement := RZBaselinePackageSpec new
		name: aName.
	[ aBlockClosure value.
		self 
			addPackage: currentRequirement ]
		ensure: [ currentRequirement := nil ].

]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> postLoadDoIt: aString [ 
	"ignore"
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> preLoadDoIt: aString [ 
	"ignore"
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> process: aBaseline [
	| projectName |
	projectName := aBaseline class name allButFirst: 'BaselineOf' size.
	project := RZProject named: projectName.
	^ aBaseline baseline: self
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> project: aString copyFrom: other with: aBlockClosure [ 
	| projectRequirement |
	projectRequirement := (self requirementAt: other) copy name: aString.
	
]

{ #category : #visiting }
RZBaselineSpecAdapter >> project: aName with: aBlockClosure [ 
	self halt.
	projectDependencyProperties := Dictionary with: 'version' -> 'stable'.
	aBlockClosure value.
	description addDependency: (
		self 
			newVersionString: (projectDependencyProperties at: 'version') 
			repositoryUrl: (projectDependencyProperties at: 'repository') 
			name: aName )
]

{ #category : #accessing }
RZBaselineSpecAdapter >> projectName: aString [ 
	self halt.
	description projectName: aString
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> projectRequirementFor: aString [
	^ RZBaselineProjectRequirement new
		scope: self currentScope;
		name: aString
]

{ #category : #visiting }
RZBaselineSpecAdapter >> repository: aRepositoryUrlString [
	currentRequirement repository: aRepositoryUrlString 
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> requirementAt: aString [ 
	^ requirements at: aString
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> requirementAt: aString put: aRequirement [ 
	requirements at: aString put: aRequirement 
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> requirements [
	^ requirements
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> requires: aCollection [ 
	currentRequirement requires: aCollection
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> version: aString [ 
	self halt.
	"ignore for now"
]

{ #category : #visiting }
RZBaselineSpecAdapter >> versionString: aString [ 
	
	currentRequirement
		version: aString
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> viewAt: aString put: aCollection [ 
	views 
		at: aString 
		put: aCollection
]
