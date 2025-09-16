extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
const explosion = preload("res://staff and spells/explosion.tscn")
@onready var fireball: Node2D = $"."

const SPEED: int = 250
 
 
func _process(delta: float) -> void:
	position += transform.x * SPEED * delta
	animated_sprite_2d.play("basic")
	
 
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		
		queue_free()
		body.take_damage(2)
		
