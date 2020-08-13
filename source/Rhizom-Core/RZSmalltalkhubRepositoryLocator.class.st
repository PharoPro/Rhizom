Class {
	#name : #RZSmalltalkhubRepositoryLocator,
	#superclass : #RZHttpRepositoryLocator,
	#category : #'Rhizom-Core-Repository'
}

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator class >> matchesHostname: aString [ 
	^ { 'smalltalkhub.com' . 'www.smalltalkhub.com' } includes: aString
]

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator >> allConfigurationNames [
	| fileNames |
	[ fileNames := (('href="([^"]+)"' asRegex matchesIn: self urlContents collect: #yourself)
		collect: [ :each | each copyFrom: 7 to: each size - 1 ])
			select: [:each | each beginsWith: 'ConfigurationOf' ].
	^ fileNames ]
	on: Error do: [ :err | ^ #() ]
]

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator >> cachePath [
	^ self scratchDirectory 
]

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator >> configurationNameFor: aString [ 
	^ (RZConfigurationOfNameSpec fromString: aString)
		metaRepo: self 
]

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator >> findConfigurationFor: aString [ 
	| configurations number |
	configurations := Dictionary new.
	self allConfigurationNames do: [ :filename | | c |
		c := self configurationNameFor: filename.
		number := configurations 
			at: c basename 
			ifPresent: [:x | x versionNumber ]
			ifAbsent: [ 0 ].
		(c versionNumber > number) ifTrue: [ 
			configurations 
				at: c basename 
				put: c 
		 ] ].
	^ configurations values
		
]

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator >> loadRequirement: aProjectRequirement [ 
	| config bytes mcz |
	config := self findConfigurationFor: aProjectRequirement name.
	config first download.
	bytes := (self scratchDirectory / config first printString) asFileReference binaryReadStream upToEnd.
	mcz := MCMczReader versionFromStream: bytes readStream.
	mcz load
	
]

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator >> repositoryIn: aString [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator >> scratchDirectory [
	| path |
	path := 'rhizom' asFileReference / ($/ join: (url pathSegments copyWithFirst: url host )). 
	^ path ensureCreateDirectory 
]

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator >> url [
	^ url
]

{ #category : #'as yet unclassified' }
RZSmalltalkhubRepositoryLocator >> urlContents [
	| indexFile |
	indexFile := self scratchDirectory / 'index.html'.
	indexFile exists
		ifFalse: [  
			(ZnClient new
				url: self url;
				downloadTo: indexFile) ifFalse: [ 
					PVIndexDownloadFailed signal: url asString, ' could not be downloaded' ] ].
	^ indexFile readStream upToEnd

]
