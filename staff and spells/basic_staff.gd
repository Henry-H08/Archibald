extends Node2D
@onready var pew: Node2D = $"."
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var camera_2d: Camera2D = $"../Camera2D"
@onready var particles: GPUParticles2D = $GPUParticles2D

var can_use = true
var spells = [magic_missile, fireball, triple_ice, ice_storm]
var current_spell = magic_missile
var current = 0
var spell = []

class magic_missile:
	const title: String = "magic_missile"
	const file: = preload("res://staff and spells/magic_missile.tscn")
	const delay: float = 0.1
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



func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	current_spell = spells[current]

	Global.current_spell = current_spell.title
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
 
	if Input.is_action_pressed("shoot"):
		if can_use == true:
			camera_2d.apply_shake(current_spell.shake)
			var bullet_instance = current_spell.file.instantiate()
			get_tree().root.add_child(bullet_instance)
			bullet_instance.global_position = pew.global_position
			bullet_instance.rotation = rotation
			can_use = false
			particles.emitting = true
			await get_tree().create_timer(current_spell.delay).timeout
			particles.emitting = false
			can_use = true
		
	
	if Input.is_action_just_pressed("spell_left"):
		if current == 0:
			current = 1
		else:
			current -= 1
	if Input.is_action_just_pressed("spell_right"):
		if current == 3:
			current = 0
		else:
			current += 1
	
		
