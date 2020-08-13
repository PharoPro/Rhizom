Class {
	#name : #RZConfigurationOfNameSpec,
	#superclass : #Object,
	#instVars : [
		'versionNumber',
		'basename',
		'author',
		'metaRepo'
	],
	#category : #'Rhizom-Core'
}

{ #category : #'instance creation' }
RZConfigurationOfNameSpec class >> fromString: aString [
	^ self new initializeFromString: aString
]

{ #category : #accessing }
RZConfigurationOfNameSpec >> basename [
	^ basename
]

{ #category : #'as yet unclassified' }
RZConfigurationOfNameSpec >> download [
	self filePath exists ifFalse: [  
		ZnClient new
			url: (metaRepo url / self printString);
			downloadTo: self filePath ].
]

{ #category : #'as yet unclassified' }
RZConfigurationOfNameSpec >> filePath [ 
	^ metaRepo cachePath / self printString
]

{ #category : #initialization }
RZConfigurationOfNameSpec >> initializeFromString: aString [
	| dottedParts dashedParts |
	dottedParts := $. split: aString.
	self assert: dottedParts last = #mcz.
	versionNumber := dottedParts second asNumber.
	dashedParts := $- split: dottedParts first.
	basename := dashedParts first.
	author := dashedParts second
]

{ #category : #accessing }
RZConfigurationOfNameSpec >> metaRepo: aMetaRepo [ 
	metaRepo := aMetaRepo 
]

{ #category : #printing }
RZConfigurationOfNameSpec >> printOn: aStream [
	aStream << basename << '-' << author << '.' << versionNumber asString << '.mcz'
]

{ #category : #'as yet unclassified' }
RZConfigurationOfNameSpec >> url [
	^ metaRepo url / self printString
]

{ #category : #accessing }
RZConfigurationOfNameSpec >> versionNumber [
	^ versionNumber
]
