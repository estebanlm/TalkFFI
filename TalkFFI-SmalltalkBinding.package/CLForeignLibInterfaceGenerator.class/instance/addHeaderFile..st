accessing
addHeaderFile: aHeaderFilename
	self
		addHeader:
			(CLHeaderSpecification new
				fileName: (self includeDir / aHeaderFilename) fullName;
				compilationOptions: self compilationOptions)