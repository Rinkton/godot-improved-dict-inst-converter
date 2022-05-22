# all arrays should have only one type of elements
# get_tscn

# node
# deep
# auto array
extends Node


func insts2dicts(arr : Array) -> Array:
	var dict_arr := []
	for elem in arr:
		if typeof(elem) == TYPE_OBJECT:
			var dict := _inst2dict(elem)
			dict_arr.append(dict)
		else:
			return arr
	return dict_arr

func _inst2dict(inst : Object) -> Dictionary:
	var dict := inst2dict(inst)
	var i := 2
	while i < len(dict):
		var key = dict.keys()[i]
		var value = dict.values()[i]
		if typeof(value) == TYPE_OBJECT:
			dict[key] = inst2dict(value)
		elif typeof(value) == TYPE_ARRAY:
			dict[key] = insts2dicts(value)
		i+=1
	return dict

func dicts2insts(arr : Array) -> Array:
	var inst_arr := []
	for elem in arr:
		if typeof(elem) == TYPE_DICTIONARY:
			var inst := _dict2inst(elem)
			inst_arr.append(inst)
		else:
			return arr
	return inst_arr

func _dict2inst(dict : Dictionary) -> Object:
	var i := 2
	while i < len(dict):
		var key = dict.keys()[i]
		var value = dict.values()[i]
		if typeof(value) == TYPE_DICTIONARY:
			dict[key] = dict2inst(value)
		elif typeof(value) == TYPE_ARRAY:
			dict[key] = dicts2insts(value)
		i+=1
	var inst := dict2inst(dict)
	var node : Node
	if inst.has_method("get_tscn"):
		node = load(inst.get_tscn()).instance()
	else:
		return inst
	i = 2
	while i < len(dict):
		var key = dict.keys()[i]
		var value = dict.values()[i]
		node.set(key, value)
		i+=1
	return node
