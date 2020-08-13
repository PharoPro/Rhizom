Extension { #name : #BaselineOf }

{ #category : #'*Rhizom-Metacello' }
BaselineOf >> asRhizomProject [
	^ RZBaselineSpecAdapter new
		process: self;
		project
]
