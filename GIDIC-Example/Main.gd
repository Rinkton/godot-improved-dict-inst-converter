extends VBoxContainer


const GUY := preload("res://Guy.tscn")


func _ready():
	var guy = deep_demonstration()
	var guys = array_handling_demonstration(guy)
	insts_can_be_nodes_demonstration(guys)


# All object is converting through, all his properties and properties of his properties
func deep_demonstration():
	# create inst
	var profession := Profession.new()
	profession.salary = 1000
	var guy = Guy.new()
	guy.surname = "Herrington"
	guy.profession = profession
	# inst2dict
	var guy_dict = gidic._inst2dict(guy)
	# dict2inst back
	var guy_inst = gidic._dict2inst(guy_dict)
	return guy_inst

# You don't need to for-loop an array for converting, just put it in insts2dicts/dicts2insts and you all set
func array_handling_demonstration(guy_sample):
	# create inst
	var arr = [guy_sample, guy_sample, guy_sample]
	# inst2dict
	var dicts = gidic.insts2dicts(arr)
	# dict2inst
	var arr_inst = gidic.dicts2insts((dicts))
	return arr_inst

# Original inst2dict/dict2inst converts all in object, even if initially inst was a node,
# so, if it's crucial and you want create new node from inst, then define get_tscn() function like
# in Guy.gd and return there an path to tscn of your node.
func insts_can_be_nodes_demonstration(guys):
	for guy in guys:
		add_child(guy)
