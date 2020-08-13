Class {
	#name : #RZGithubRepositoryLocator,
	#superclass : #RZRepositoryLocator,
	#instVars : [
		'ownerName',
		'directory',
		'project',
		'version'
	],
	#category : #'Rhizom-Core-Repository'
}

{ #category : #'as yet unclassified' }
RZGithubRepositoryLocator class >> fromString: aString [ 
	^ self new
		initializeFrom: aString
]

{ #category : #'as yet unclassified' }
RZGithubRepositoryLocator class >> schemeName [
	^ #github
]

{ #category : #'as yet unclassified' }
RZGithubRepositoryLocator >> asGenericUrl [
	^ 'git://git@github.com/', ($/ join: { ownerName . project }) ,'.git'
]

{ #category : #'as yet unclassified' }
RZGithubRepositoryLocator >> hostname [
	^ 'github.com'
]

{ #category : #'as yet unclassified' }
RZGithubRepositoryLocator >> initializeFrom: aString [
	| stream projectReference |
	stream := aString readStream.
	"skip (http|https)//"
	stream next: (aString indexOf: $:) + 2.
	ownerName := stream upTo: $/.
	projectReference := $: split: (stream upTo: $/).
	directory := stream atEnd 
		ifTrue: [ '/' ]
		ifFalse: [ stream upToEnd ].
	project := projectReference first.
	version := (projectReference size > 1)
		ifTrue: [ projectReference second ]
		ifFalse: [ #default ]
]

{ #category : #'as yet unclassified' }
RZGithubRepositoryLocator >> loadRequirement: aProjectRequirement [ 
	| repository baselinePackages baselinePackage |
	repository := aProjectRequirement repository repositoryIn: 'rhizom'. 
	(repository commitishNamed: aProjectRequirement repository version) checkout.
	baselinePackages := repository project packages 
		select: [ :each | each name beginsWith: 'BaselineOf' ].
	(baselinePackages size = 0) ifTrue: [ Error signal: 'No baseline package' ].
	 baselinePackage := (baselinePackages size = 1) 
		ifTrue: [  baselinePackages first ]
		ifFalse: [ baselinePackages detect: [:each | self halt "each name endsWith: version project name" ] ].
	baselinePackage load.
]

{ #category : #printing }
RZGithubRepositoryLocator >> printOn: aStream [
	aStream << 'github://' << ownerName << '/' << project.
	version ifNotNil: [ 
		aStream << ':' << version ].
	aStream << '/'.
	directory ifNotNil: [ 
		aStream << directory  ]
]

{ #category : #'as yet unclassified' }
RZGithubRepositoryLocator >> repositoryIn: path [
	|  location creator |
	location := (path asFileReference asAbsolute / self hostname / ownerName) ensureCreateDirectory; / project.
	creator := IceRepositoryCreator new 
		location: location;
		ensureProjectFile.
			
	directory ifNotNil: [
		creator
			subdirectory: directory ].

	^ location exists 
		ifTrue: [ creator addLocalRepository ]
		ifFalse: [ 
			creator 
				addRemote: self asGenericUrl;	
				cloneRepository ]
]

{ #category : #'as yet unclassified' }
RZGithubRepositoryLocator >> version [
	^ version
]
