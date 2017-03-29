# TalkFFI
Automatic FFI generation for Pharo

This is a port of the project originally made by [Ciprian Teodorov](http://smalltalkhub.com/#!/~CipT/TalkFFI).

For now it supports the generation of UFFI binding, but the infrastructure should be easily retargetable to enable generation of bindings to other libraries (even other languages maybe).

To load the project evaluate:

```Smalltalk
Metacello new 
  repository: 'github://estebanlm/TalkFFI';
  baseline: 'TalkFFI';
  load.
```
IMPORTANT: You will need to define the path to your 32bit libclang dynamic library (release 3.9) in:

```Smalltalk
LibClangMap>>macModuleName.
```

For some usage scenarios look at:

```Smalltalk
CLForeign2NBGenerator libClang39Mapping.
CLForeign2NBGenerator llvmc39Mapping .
```
