Class {
	#name : #RZGithubRepositoryLocator,
	#superclass : #RZRepositoryLocator,
	#instVars : [
		'ownerName',
		'directory',
		'project',
		'version'
	],
	#category : #'Rhizom-Core'
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

{ #category : #printing }
RZGithubRepositoryLocator >> printOn: aStream [
	aStream << 'github://' << ownerName << '/' << project.
	version ifNotNil: [ 
		aStream << ':' << version ].
	aStream << '/'.
	directory ifNotNil: [ 
		aStream << directory  ]
]
