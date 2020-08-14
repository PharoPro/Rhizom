Class {
	#name : #RZConfigurationProjectRequirement,
	#superclass : #RZProjectRequirement,
	#instVars : [
		'versionString',
		'className'
	],
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZConfigurationProjectRequirement >> className: aString [ 
	className := aString
]

{ #category : #'as yet unclassified' }
RZConfigurationProjectRequirement >> createRZProject [
	| configurationName configurationClass metacelloVersion |
	configurationName := ('ConfigurationOf', name) asSymbol.
	configurationClass := self class environment at: configurationName.
	metacelloVersion := configurationClass project version: #stable.
	^ RZConfigurationSpecAdapter new
		visitConfiguration: configurationClass  withVersion: metacelloVersion;
		project
]

{ #category : #'as yet unclassified' }
RZConfigurationProjectRequirement >> load [
	repository loadRequirement: self
]

{ #category : #'as yet unclassified' }
RZConfigurationProjectRequirement >> version [
	^ version
]

{ #category : #'as yet unclassified' }
RZConfigurationProjectRequirement >> versionString: aString [ 
	self halt.
	versionString := aString
]
