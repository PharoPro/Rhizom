Class {
	#name : #RZBaselineTest,
	#superclass : #TestCase,
	#category : #'Rhizom-Metacello-Tests'
}

{ #category : #tests }
RZBaselineTest >> testPakbotRead [
	| project |
	project := PBBaselineVisitor new  
		baseline: BaselineOfIceberg new;
		project.
	self assert: project externalProjects size equals: 3.

]

{ #category : #tests }
RZBaselineTest >> testPakbotSolve [
	| project solver load |
	project := PBBaselineVisitor new  
		baseline: BaselineOfIceberg new;
		project.
	self assert: project externalProjects size equals: 3.
	load := project resolve.

]

{ #category : #tests }
RZBaselineTest >> testRead [
	| project sheet |
	project := BaselineOfIceberg new asRhizomProject.
	self assert: project requirements size equals: 7.
	self halt.
	sheet := RZLoadSheet new buildFor: project.
	sheet solveVersionConflicts.
	sheet load.
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
