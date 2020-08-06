Class {
	#name : #RZCurrentScope,
	#superclass : #DynamicVariable,
	#category : #'Rhizom-Metacello'
}

{ #category : #accessing }
RZCurrentScope >> default [
	^ RZRequirementScope new
]
