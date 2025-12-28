extends CharacterBody2D

var health = randi_range(1,2)
var spawn_coin = 0
var give_point = 0
@onready var player = get_node("/root/main/player")
const coin = preload("res://enemy/coin.tscn")
@onready var area_2d: Area2D = $Area2D


func _physics_process(delta):
	
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 5
	move_and_slide()
	
	for body in area_2d.get_overlapping_bodies():
		if body.has_method("get_hit"):
			body.get_hit()
			
	if health <= 0:
		spawn_coin = randi_range(0,1)
		give_point = randi_range(0,5)
		
		if spawn_coin == 1:
			var coin_instance = coin.instantiate()
			coin_instance.global_position = global_position
			get_tree().root.add_child(coin_instance)
			await get_tree().create_timer(0.01).timeout
			queue_free()
		else:
			queue_free()
		
		if give_point == 5:
			Global.points += 1
		else:
			pass
	
func take_damage(dmg):
	health -= dmg 
	
	
