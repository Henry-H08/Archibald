extends CharacterBody2D

var health = 2

@onready var player = get_node("/root/main/player")
const coin = preload("res://coin.tscn")
@onready var area_2d: Area2D = $Area2D


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 5
	move_and_slide()
	
	for body in area_2d.get_overlapping_bodies():
		if body.has_method("get_hit"):
			body.get_hit()
	
func take_damage(dmg):
	health -= dmg 
	if health <= 0:
		var coin_instance = coin.instantiate()
		coin_instance.global_position = global_position
		get_tree().root.add_child(coin_instance)
		await get_tree().create_timer(0.01).timeout
		queue_free()
