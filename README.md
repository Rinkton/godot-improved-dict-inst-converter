# godot-improved-dict-inst-converter
Godot Improved Dict-Inst Converter(gidic). Made simular to inst2dict and dict2inst functions, but improve them. 

**What was improved in built-in functions?:**

1. Deep

Built-in functions doesn't make converting deep, only object itself, but not its properties. It's declared as bug: [Github Issue](https://github.com/godotengine/godot/issues/6533) but it's don't fixed since 2018. So there's it's working as it should.

2. Array handling

There's insts2dicts and dicts2insts functions, if you need to converting array's instances, just put the array to func and you all set.

3. Dict can be converted to Node

Instances can be nodes, not just objects; so dictionary have to convert into Node if is needed

**In this repository you can to find gidic.gd in the Releases. That file have several functions:**

- insts2dicts(arr : Array) -> Array

- _inst2dict(inst : Object) -> Dictionary

- dicts2insts(arr : Array) -> Array

- _dict2inst(dict : Dictionary) -> Object

**Example project**:

It is, look through GIDIC-Example...
