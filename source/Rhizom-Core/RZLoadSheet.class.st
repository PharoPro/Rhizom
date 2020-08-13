Class {
	#name : #RZLoadSheet,
	#superclass : #Object,
	#instVars : [
		'projects',
		'requirements'
	],
	#category : #'Rhizom-Core'
}

{ #category : #adding }
RZLoadSheet >> addProject: aProject [
	projects add: aProject.
]

{ #category : #building }
RZLoadSheet >> buildFor: aProject [
	projects add: aProject.
	self resolveProject: aProject.
	self run
]

{ #category : #initialization }
RZLoadSheet >> initialize [ 
	super initialize.
	projects := Set new.
	requirements := OrderedCollection new
]

{ #category : #'as yet unclassified' }
RZLoadSheet >> loadAllProjects [
	| project p1 |
	project := projects anyOne asScoped: #( 'MacOS' 'pharo8.x' ).
	project requirements do: [ :p |
		self class environment 
			at: ('BaselineOf', p name) asSymbol 
			ifAbsent: [ self loadRequirement: p  ].
		p1 := (self class environment at: ('BaselineOf', p name) asSymbol) new asRhizomProject.
		"self halt."  ]
]

{ #category : #'as yet unclassified' }
RZLoadSheet >> loadRequirement: aProjectRequirement [ 
	| repository baselinePackages version baselinePackage |
	repository := aProjectRequirement repository repositoryIn: 'rhizom'. 
	(repository commitishNamed: aProjectRequirement repository version) checkout.
	baselinePackages := repository project packages 
		select: [ :each | each name beginsWith: 'BaselineOf' ].
	(baselinePackages size = 0) ifTrue: [ Error signal: 'No baseline package' ].
	 baselinePackage := (baselinePackages size = 1) 
		ifTrue: [  baselinePackages first ]
		ifFalse: [ baselinePackages detect: [:each | each name endsWith: version project name ] ].
	baselinePackage load.
]

{ #category : #'as yet unclassified' }
RZLoadSheet >> resolveProject: aRZProject [ 
	requirements addAll: aRZProject requirements
]

{ #category : #running }
RZLoadSheet >> run [
	| requirement project |
	[ requirements isEmpty ] whileFalse: [ 
		requirement := requirements removeFirst.
		requirement load.
		project := requirement createRZProject.
		projects add: project.
		self resolveProject: project.
		 ].
]
