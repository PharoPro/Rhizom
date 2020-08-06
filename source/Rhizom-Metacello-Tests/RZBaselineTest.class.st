Class {
	#name : #RZBaselineTest,
	#superclass : #TestCase,
	#category : #'Rhizom-Metacello-Tests'
}

{ #category : #tests }
RZBaselineTest >> testRead [
	| adapter baselinePackage baseline |
	adapter := RZBaselineSpecAdapter new.
	baseline := BaselineOfIceberg new.
	(baseline respondsTo: #baseline:) ifFalse: [ Error signal: baselinePackage name asString, ' does not have basline: method' ].
	adapter process: baseline.
	self assert: adapter requirements size equals: 7
]
