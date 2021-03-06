"
I am an abstract base class for package refactorings.

All that I provide is the package name, my subclass refactorings are operating on, and a instance creation method for setting the package name and an initial namespace model.
"
Class {
	#name : #RBPackageRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'packageName'
	],
	#category : #'Refactoring-Core-Refactorings'
}

{ #category : #'as yet unclassified' }
RBPackageRefactoring class >> model: aRBModel packageName: aName [ 
	^ self new
		model: aRBModel;
		packageName: aName;
		yourself
]

{ #category : #accessing }
RBPackageRefactoring class >> packageName: aName [
	^self new packageName: aName
]

{ #category : #accessing }
RBPackageRefactoring >> packageName [

	^ packageName
]

{ #category : #accessing }
RBPackageRefactoring >> packageName: anObject [

	packageName := anObject
]
