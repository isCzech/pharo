"
Abstract superclass for UI's of Dr Test
"
Class {
	#name : #AbstractDrTestsUI,
	#superclass : #SpPresenter,
	#instVars : [
		'pluginResult',
		'testsConfiguration',
		'startButton',
		'currentPlugin',
		'switchButton'
	],
	#category : #'DrTests-Spec'
}

{ #category : #testing }
AbstractDrTestsUI class >> isAbstract [

	^ self name = #AbstractDrTestsUI
]

{ #category : #accessing }
AbstractDrTestsUI >> currentPlugin [

	^ currentPlugin
]

{ #category : #accessing }
AbstractDrTestsUI >> currentPlugin: anObject [
	"If a plugin was set before, unsubscribe first."

	currentPlugin ifNotNil: [ currentPlugin unconfigureUI: self ].
	currentPlugin := anObject.
	currentPlugin configureUI: self
]

{ #category : #'announcement handling' }
AbstractDrTestsUI >> handlePluginStatusUpdate: aDTStatusUpdate [

	self updateStatus: aDTStatusUpdate message
]

{ #category : #'private - initialization' }
AbstractDrTestsUI >> initializeButtons [

	startButton := self newButton.
	switchButton := self newButton.
	switchButton
		icon: (self iconNamed: #smallRemoteOpen)
]

{ #category : #initialization }
AbstractDrTestsUI >> initializePresenter [

	self startButton action: [ self runPlugin ].
	self switchButton action: [ self switchUI ]
]

{ #category : #initialization }
AbstractDrTestsUI >> initializeWidgets [

	self initializeButtons
]

{ #category : #'api - locking' }
AbstractDrTestsUI >> lock [
	"Lock the UI, once this method is called, the user is not able to click on buttons or lists anymore."
	
	self locked: false
]

{ #category : #'api - locking' }
AbstractDrTestsUI >> locked: aBoolean [
	"Lock or unlock widgets returned by #subwidgetsToLock depending on aBoolean."
	
	self subwidgetsToLock
		do: [ :subwidget | subwidget enabled: aBoolean ]
]

{ #category : #accessing }
AbstractDrTestsUI >> pluginResult [

	^ pluginResult
]

{ #category : #accessing }
AbstractDrTestsUI >> pluginResult: anObject [

	pluginResult := anObject
]

{ #category : #running }
AbstractDrTestsUI >> runPlugin [

	self runPluginFor: self testsConfiguration
]

{ #category : #running }
AbstractDrTestsUI >> runPluginFor: aTestsConfiguration [

	[ self
			lock;
			updateStatus: 'Tests started.';
			updateWithResults: (self currentPlugin runForConfiguration: aTestsConfiguration);
			updateStatus: 'Tests finished.' ] ensure: [ self unlock ]
]

{ #category : #'accessing - subwidgets' }
AbstractDrTestsUI >> startButton [

	^ startButton
]

{ #category : #'api - subwidgets configuration' }
AbstractDrTestsUI >> startButtonAction: aBlock [

	self startButton action: aBlock
]

{ #category : #'api - subwidgets configuration' }
AbstractDrTestsUI >> startButtonHelp: aString [

	self startButton help: aString
]

{ #category : #'api - subwidgets configuration' }
AbstractDrTestsUI >> startButtonLabel: aString [

	self startButton label: aString
]

{ #category : #'api - locking' }
AbstractDrTestsUI >> subwidgetsToLock [

	^ { self startButton }
]

{ #category : #accessing }
AbstractDrTestsUI >> switchButton [

	^ switchButton
]

{ #category : #accessing }
AbstractDrTestsUI >> switchButton: anObject [

	switchButton := anObject
]

{ #category : #'api - subwidgets configuration' }
AbstractDrTestsUI >> switchButtonAction: aBlock [

	self switchButton action: aBlock
]

{ #category : #actions }
AbstractDrTestsUI >> switchUI [

	self withWindowDo: [ :window | window close ]
]

{ #category : #accessing }
AbstractDrTestsUI >> testsConfiguration [

	^ testsConfiguration
]

{ #category : #accessing }
AbstractDrTestsUI >> testsConfiguration: anObject [

	testsConfiguration := anObject
]

{ #category : #'api - locking' }
AbstractDrTestsUI >> unlock [
	"Unlock the UI, once this method is called, the user is able to click on buttons or lists and to launch analysis."
	
	self locked: true
]

{ #category : #updating }
AbstractDrTestsUI >> updateStatus: aString [
	"Does nothing on purpose."
]

{ #category : #updating }
AbstractDrTestsUI >> updateUI [

	self withWindowDo: [ :window | window title: self title ]
]

{ #category : #updating }
AbstractDrTestsUI >> updateWithResults: results [

	self subclassResponsibility
]
