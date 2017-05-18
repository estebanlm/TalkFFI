fixtures
tChainStructReturnPtr

	^'typedef struct my_struct my_str;
	typedef my_str my_stru;
	typedef my_stru my_struc;
	typedef my_struc my_struct;
	
	my_struct * myFunc(my_struct inStr);'