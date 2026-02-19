extends CanvasLayer
class magic_missile:
	const title: String = "magic_missile"
	const file: = preload("res://staff and spells/magic_missile.tscn")
	const delay: float = 0.3
	const shake: float = 1

class fireball:
	const title: String = "fireball"
	const file: = preload("res://staff and spells/fireball.tscn")
	const delay: float = 0.7
	const shake: float = 3
	
class triple_ice:
	const title: String = "triple_ice"
	const file: = preload("res://staff and spells/triple_ice.tscn")
	const delay: float = 0.7
	const shake: float = 3

class ice_storm:
	const title: String = "ice_storm"
	const file: = preload("res://staff and spells/ice_storm.tscn")
	const delay: float = 0.3
	const shake: float = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_fireball_button_pressed() -> void:
	Global.spells.append(fireball)
