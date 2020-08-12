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

{ #category : #printing }
RZGithubUrlHandler >> printOn: aStream [
	aStream << 'github://' << ownerName << '/' << project.
	version ifNotNil: [ 
		aStream << ':' << version  ].
	directory 
		ifNotNil: [ aStream << directory  ]
		ifNil: [  aStream << '/' ]
]
