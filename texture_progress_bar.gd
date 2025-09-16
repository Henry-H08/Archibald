extends TextureProgressBar

#@onready var timer = $Timer
var mana = 0
var prev_mana = 0
var used_mana = false
var mana_values = 0

@onready var mana_bar: TextureProgressBar = $"."








func _process(delta: float) -> void:
	mana_bar.max_value = mana_values
	
	
	

func init_mana(_mana):
	mana_values = _mana
	mana = _mana

	max_value = mana
	value = mana

	
	 
func set_mana(new_mana):
	prev_mana = mana
	mana = new_mana
	value = mana
	used_mana = true
	
	

	
