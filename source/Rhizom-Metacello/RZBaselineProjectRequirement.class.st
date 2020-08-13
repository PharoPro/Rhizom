Class {
	#name : #RZBaselineProjectRequirement,
	#superclass : #RZProjectRequirement,
	#category : #'Rhizom-Metacello'
}

{ #category : #'as yet unclassified' }
RZBaselineProjectRequirement >> createRZProject [
	| baselineName baseline |
	baselineName := ('BaselineOf', name) asSymbol.
	baseline := self class environment at: baselineName.
	^ baseline new asRhizomProject 
]

{ #category : #'as yet unclassified' }
RZBaselineProjectRequirement >> load [
	repository loadRequirement: self
]
