Class {
	#name : #RZBaselineTest,
	#superclass : #TestCase,
	#category : #'Rhizom-Metacello-Tests'
}

{ #category : #tests }
RZBaselineTest >> testRead [
	| project sheet |
	project := BaselineOfIceberg new asRhizomProject.
	self assert: project requirements size equals: 7.
	sheet := RZLoadSheet new buildFor: project.
	"sheet addProject: project.
	sheet loadAllProjects."
	self halt.
]

{ #category : #tests }
RZBaselineTest >> testReadRequirements [
	| adapter baselinePackage baseline |
	adapter := RZBaselineSpecAdapter new.
	baseline := BaselineOfIceberg new.
	(baseline respondsTo: #baseline:) ifFalse: [ Error signal: baselinePackage name asString, ' does not have basline: method' ].
	adapter process: baseline.
	self assert: adapter project requirements size equals: 7.
	self halt.
]
