Class {
	#name : #RZCurrentScope,
	#superclass : #DynamicVariable,
	#category : #'Rhizom-Core-Base'
}

{ #category : #accessing }
RZCurrentScope >> default [
	^ RZRequirementScope new
]
