initialization
initializePrimariesToNBTypes
	Primaries2NBTypes := {
	(#bool -> #bool).
	(#char16 -> #int16).
	(#char32 -> #int32).
	(#char_s -> #char).
	(#char_u -> #uint8).
	(#double -> #double).
	(#firstbuiltin -> #void).
	(#float -> #float).
	(#int -> #int).
	(#int128 -> FFIExternalType).
	(#long -> #long).
	(#longdouble -> #FFIInt64).
	(#longlong -> #int64).
	(#schar -> #int8).
	(#short -> #int8).
	(#uchar -> #uint8).
	(#uint -> #uint).
	(#uint128 -> FFIExternalType).
	(#ulong -> #ulong).
	(#ulonglong -> #uint64).
	(#ushort -> #uint8).
	(#void -> #void).
	(#wchar -> FFICharacterType)} asDictionary