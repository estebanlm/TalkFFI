fixtures
tVoidPtrReturn2

	^'
	typedef void avoid;
	typedef avoid bvoid;
	typedef bvoid cvoid;
	typedef cvoid *my_void;
	
	my_void myFunc(avoid * x, bvoid * y, cvoid *z);'