Class {
	#name : #RZGithubUrlHandler,
	#superclass : #RZUrlHandler,
	#instVars : [
		'ownerName',
		'directory',
		'project',
		'version'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZGithubUrlHandler class >> fromString: aString [ 
	^ self new
		initializeFrom: aString
]

{ #category : #'as yet unclassified' }
RZGithubUrlHandler class >> schemeName [
	^ #github
]

{ #category : #'as yet unclassified' }
RZGithubUrlHandler >> initializeFrom: aString [
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
RZGithubUrlHandler >> printOn: aStream [
	aStream << 'github://' << ownerName << '/' << project.
	version ifNotNil: [ 
		aStream << ':' << version  ].
	directory 
		ifNotNil: [ aStream << directory  ]
		ifNil: [  aStream << '/' ]
]
