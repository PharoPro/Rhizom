Class {
	#name : #RZCurrentScope,
	#superclass : #DynamicVariable,
	#category : #'Rhizom-Core'
}

{ #category : #accessing }
RZCurrentScope >> default [
	^ RZRequirementScope new
]
