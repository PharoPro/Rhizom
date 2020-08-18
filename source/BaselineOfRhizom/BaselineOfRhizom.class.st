Class {
	#name : #BaselineOfRhizom,
	#superclass : #BaselineOf,
	#category : #BaselineOfRhizom
}

{ #category : #baseline }
BaselineOfRhizom >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'Rhizom-Core';
				package: 'Rhizom-Metacello' with: [ spec requires: #('Rhizom-Core') ];
				package: 'Rhizom-Metacello-Tests' with: [ spec requires: #('Rhizom-Metacello') ].
				
			spec
				group: 'default' with: 'Tests';
				group: 'Core' with: 'Rhizom-Core';
				group: 'Tests' with: #('Rhizom-Metacello-Tests') ]
]
