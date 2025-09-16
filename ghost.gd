extends Sprite2D
@onready var ghost: Sprite2D = $"."


func _ready():
	ghosting()
	if get_global_mouse_position().x < global_position.x:
		ghost.flip_h = true
	else:
		ghost.flip_h = false

func set_property(tx_pos, tx_scale):
	position = tx_pos
	scale = tx_scale
	
func ghosting():
	var tween_fade = get_tree().create_tween()
	tween_fade.tween_property(self, "self_modulate", Color(1, 1, 1, 0), 0.75)
	await tween_fade.finished
	queue_free()
	
