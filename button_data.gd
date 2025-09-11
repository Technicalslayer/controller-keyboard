class_name ButtonData
extends Resource

@export
var key_code: int = 0x41 # "A" by default
var activation_type_enum # rename this

func _init(_key_code = 0x41, _activation_type_enum = 0):
	key_code = _key_code
	activation_type_enum = _activation_type_enum
