extends Node2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready():
	spawn_enemy()
	spawn_enemy()
	spawn_enemy()
	
	

func spawn_enemy():
	var new_enemy = preload("res://enemy/enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy)


func _on_timer_timeout():
	spawn_enemy()
	



	
