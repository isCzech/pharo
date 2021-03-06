Extension { #name : #GLMCompositePresentation }

{ #category : #'*glamour-rubric-presentations' }
GLMCompositePresentation >> pharoMethod [
	^ self custom: GLMPharoMethodPresentation new
]

{ #category : #'*glamour-rubric-presentations' }
GLMCompositePresentation >> pharoPlayground [
	self
		deprecated: 'Use #pharoScript instead'
		transformWith: '`@rec pharoPlayground' -> '`@rec pharoScript'.
	
	^ self custom: GLMPharoScriptPresentation new
]

{ #category : #'*glamour-rubric-presentations' }
GLMCompositePresentation >> pharoScript [
	^ self custom: GLMPharoScriptPresentation new
]

{ #category : #'*glamour-rubric-presentations' }
GLMCompositePresentation >> rubricText [
	self
		deprecated: 'Use #text instead'
		transformWith: '`@rec rubricText' -> '`@rec text'.
	
	^ self custom: GLMRubricTextPresentation new
]
