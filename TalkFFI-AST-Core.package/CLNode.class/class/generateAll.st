as yet unclassified
generateAll
	"		self generateAll				"
	
	self createAccessors.	
	"visitor"
	self createAcceptorMethods.
	self createVisitorClass.
	"testing"
	self createTestingMethods .