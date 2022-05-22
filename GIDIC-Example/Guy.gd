extends TextureRect
class_name Guy


var surname
var profession


func _process(_delta):
	if surname:
		$Name.text = surname
	if profession:
		if profession.salary:
			$Salary.text = str(profession.salary)


func get_tscn():
	return "res://Guy.tscn"
