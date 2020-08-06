Class {
	#name : #RZMetacelloSpecAdapter,
	#superclass : #Object,
	#instVars : [
		'description'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZMetacelloSpecAdapter >> currentScope [

	^ RZCurrentScope value
]

{ #category : #accessing }
RZMetacelloSpecAdapter >> description [
	self halt.
	^ description
]

{ #category : #initialization }
RZMetacelloSpecAdapter >> initialize [ 
	super initialize.
	description := PVVersionDescription new
]

{ #category : #'instance creation' }
RZMetacelloSpecAdapter >> newVersionString: versionString repositoryUrl: repositoryUrl name: name [
self halt.
	^ PVVersionDependency new 
		projectName: name;
		url: repositoryUrl;
		versionString: versionString 
]

{ #category : #enumerating }
RZMetacelloSpecAdapter >> with: attributes do: aBlock [

	^ RZCurrentScope 
		value: attributes 
		during: aBlock
]
