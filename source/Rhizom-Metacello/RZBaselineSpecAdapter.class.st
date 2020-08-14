"
I'm a visitor for Metacello Baselines.
I build a Pakbot project from the information I get from the baseline.
The project will not be registered in the default registry but in a new one created for the context of this visitor.
"
Class {
	#name : #RZBaselineSpecAdapter,
	#superclass : #RZMetacelloSpecAdapter,
	#instVars : [
		'currentRequirement'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #visiting }
RZBaselineSpecAdapter >> baseline: aString with: aBlock [
	self 
		gitProjectRequirementFor: aString
		with: aBlock

]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> blessing: aString [ 
	"ignore"
]

{ #category : #visiting }
RZBaselineSpecAdapter >> className: aString [ 
	currentRequirement className: aString
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> configuration: aString with: aBlock [
	self 
		httpProjectRequirementFor: aString
		with: aBlock

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

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> gitProjectRequirementFor: aString [
	^ RZBaselineProjectRequirement new
		scope: self currentScope;
		name: aString
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> gitProjectRequirementFor: aString with: aBlock [
	currentRequirement := self gitProjectRequirementFor: aString.
	[ aBlock value.
		project   
			requirementAt: aString 
			put: currentRequirement ]
		ensure: [ currentRequirement := nil ].

]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> httpProjectRequirementFor: aString [
	^ RZConfigurationProjectRequirement new
		scope: self currentScope;
		name: aString
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> httpProjectRequirementFor: aString with: aBlock [
	currentRequirement := self httpProjectRequirementFor: aString.
	[ aBlock value.
		project   
			requirementAt: aString 
			put: currentRequirement ]
		ensure: [ currentRequirement := nil ].

]

{ #category : #api }
RZBaselineSpecAdapter >> import: spec [
	"ignore"
]

{ #category : #visiting }
RZBaselineSpecAdapter >> loads: parts [ 
	currentRequirement view: (parts isString 
		ifTrue: [ Array with: parts ]
		ifFalse: [ parts ])
]

{ #category : #visiting }
RZBaselineSpecAdapter >> newScopeWith: attribute [
	^ self currentScope newScopeWith: attribute
]

{ #category : #'as yet unclassified' }
RZBaselineSpecAdapter >> package: aString [ 
	project 
		addPackage: (RZPackageSpec named: aString)
]

{ #category : #visiting }
RZBaselineSpecAdapter >> package: aName with: aBlockClosure [ 
	currentRequirement := RZPackageSpec new
		name: aName.
	[ aBlockClosure value.
		project 
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
	projectRequirement := (project requirementAt: other) copy name: aString.
	
]

{ #category : #visiting }
RZBaselineSpecAdapter >> project: aString with: aBlock [
	self 
		httpProjectRequirementFor: aString
		with: aBlock 
]

{ #category : #accessing }
RZBaselineSpecAdapter >> projectName: aString [ 
	self halt.

]

{ #category : #visiting }
RZBaselineSpecAdapter >> repository: aRepositoryUrlString [
	currentRequirement repositoryUrlString: aRepositoryUrlString 
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
