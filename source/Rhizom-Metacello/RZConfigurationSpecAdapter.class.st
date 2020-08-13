"
A MCModel2MTModelVisitor visits a Metacello model to transform it to a MT Model .

Instance variables:
	- project : the root element (an MTProject) of the target model
	
	
MCModel2MTModelVisitor new 
	visitConfiguration: ConfigurationOfVersionner  
	withVersion: (ConfigurationOfVersionner project version: #development)
"
Class {
	#name : #RZConfigurationSpecAdapter,
	#superclass : #RZMetacelloSpecAdapter,
	#category : #'Rhizom-Metacello'
}

{ #category : #initialization }
RZConfigurationSpecAdapter >> initialize [ 
	super initialize.
	project := RZProject new
]

{ #category : #visiting }
RZConfigurationSpecAdapter >> visitConfiguration: aConfigurationClass withVersion: aVersion [
	"visits a Configuration class for the specified version and returns the project root object.
	 Returns the project root object or nil if the given version is nil."

	aVersion ifNil: [ ^ nil ].
	"project version: aVersion versionString."
	project name: (aConfigurationClass name copyFrom: 16 to: aConfigurationClass name size).
	self visitMCVersion: aVersion.
]

{ #category : #visiting }
RZConfigurationSpecAdapter >> visitMCGroup: aGroup [
	self group: aGroup name with: aGroup includes
]

{ #category : #visiting }
RZConfigurationSpecAdapter >> visitMCPackage: aPackage [
	| package |
	package := RZConfigurationOfPackageSpec new.
	aPackage includes notEmpty ifTrue: [ self halt ].
	aPackage requires notEmpty ifTrue: [ self halt ].

	package 
		name: aPackage name;
		file: aPackage file.
	project addPackage: package
]

{ #category : #visiting }
RZConfigurationSpecAdapter >> visitMCProjectAsRequiredProject: aProject [
	"visit a Metacello Project to add it as a required projet. It is quite the same as visitMCProject except that we won't dive into the project structure.
	aProject is an instance of MetacelloMCProjectSpec."
	| requiredProject repos |
	requiredProject := PVVersionDependency new projectName: (aProject name ifNil: [self halt]).
	repos := (aProject repositorySpecs collect: [ :aRepoSpec | aRepoSpec description]).
	self assert: repos size = 1.
	requiredProject url: repos first.
	requiredProject versionString: (aProject versionString 
		ifNotNil: [ aProject versionString ]
		ifNil: [ (SourceRepositoryUrl fromString: repos first) branch ]).
	self halt.
	"description addDependency: requiredProject "
]

{ #category : #visiting }
RZConfigurationSpecAdapter >> visitMCVersion: aVersion [
	"visit a Metacello Version"
	
	| groups packages projects repositories |
	
	"project version
		description: aVersion spec description value;
		author: aVersion spec author value;
		timestamp: aVersion spec timestamp value.
"
	groups := aVersion groups.
	groups do:  [ :aGroup | self visitMCGroup: aGroup ].
	
	packages := aVersion packages.
	packages do:  [ :aPackage | self visitMCPackage: aPackage ].
	
	projects := aVersion projects.
	projects do:  [ :aProject | self visitMCProjectAsRequiredProject: aProject ].
	
	repositories := aVersion spec repositories list.
	"repositories ifNotEmpty:  
		[:repo | description url: repo first name ]."

]
