extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D


 
 

	
 
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()





func _on_area_2d_body_entered(body: Node2D) -> void:
	print("g")
	if body.has_method("get_coin"):
		queue_free()
		body.get_coin()
		print("h")
