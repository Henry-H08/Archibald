extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D

const SPEED: int = 50
 
 
func _process(delta: float) -> void:
	position += transform.x * SPEED * delta
	
 
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		queue_free()
		body.take_damage(1)
