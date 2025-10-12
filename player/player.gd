extends CharacterBody2D

@export var acceleration : float = 3
@export var max_speed : float = 15
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var crosshair: Sprite2D = $crosshair
@export var ghost_node : PackedScene
@onready var ghost_timer: Timer = $GhostTimer
@onready var particles: GPUParticles2D = $GPUParticles2D
@onready var health_bar = $Health_Bar
@onready var label: Label = $Health_Bar/Label
@onready var dash = $Dash
@onready var coins: Label = $coins
@onready var temp: Timer = $temp
@onready var camera_2d: Camera2D = $Camera2D
@onready var game_over: CanvasLayer = $GameOver
@onready var start: CanvasLayer = $start
@onready var start_menu: CanvasLayer = $start_menu



var input := Vector2.ZERO
var idle_time = 0
var health = 6
var mana = 7
var damage_delay = 0
var dash_speed = 150
var dash_duration = 0.2
var can_dash = true
var can_squish = true

var rotate_start
var rotate_range = 4
var rotate_speed = 0.5
var stat_menu_open = false
signal dead

static var has_started := false

func _ready():
	health_bar.init_health(health)
	Global.mana = mana
	Global.full_mana = mana
	rotate_start = rotation
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Global.player_health = health
	$start.visible = true
	get_tree().paused = true
	if has_started:
		$start.visible = false
		get_tree().paused = false
		return
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	has_started = true

func _physics_process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	mana = Global.mana
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input = input.normalized()

	label.text = str(health) + "/6"
	coins.text = str(Global.coins)
	
	
	
	if velocity.x != 0 or velocity.y != 0:
		animated_sprite_2d.play("walk")
		animated_sprite_2d.rotation += rotate_speed * delta
		var rotate_diff = animated_sprite_2d.rotation_degrees - rotate_start
		if abs(rotate_diff) > rotate_range:
			animated_sprite_2d.rotation_degrees = rotate_start + rotate_range * sign(rotate_diff)
			rotate_speed *= -1
	
	else:
		animated_sprite_2d.play("idle")
		animated_sprite_2d.rotation_degrees = 0
	
	if get_global_mouse_position().x < global_position.x:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false
		
	Global.player_position = global_position
	
	_set_crosshair()
	
	
	
		
	if health <= 0:
		$GameOver.visible = true
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		
	

	
	if Input.is_action_just_pressed("dash"):
		if can_dash == true and dash.stopped == false:
			can_dash = false
			animated_sprite_2d.scale = Vector2(0.9, 1.1)
			camera_2d.apply_shake(1)
			ghost_timer.start()
			particles.emitting = true
			dash.start_dash(dash_duration)
			await get_tree().create_timer(0.2).timeout
			animated_sprite_2d.scale = Vector2(1, 1)
			ghost_timer.stop()
			particles.emitting = false
			await get_tree().create_timer(1).timeout
			can_dash = true
			
	
	
	var speed = 15
	if speed != 15:
		print("iunno")
		
	if dash.is_dashing():
		speed = dash_speed
	else:
		speed = max_speed
		
	velocity.x = move_toward(velocity.x, speed * input.x, acceleration)
	velocity.y = move_toward(velocity.y, speed * input.y, acceleration)
	move_and_slide()
	
	
	
	Global.player_health = health
	Global.mana = mana
	
	

	
	

func _set_crosshair():
		crosshair.global_position = get_global_mouse_position()
	
		
	

		
	
func add_ghost():
	var ghost = ghost_node.instantiate()
	ghost.set_property(position, scale)
	get_tree().current_scene.add_child(ghost)

func _on_ghost_timer_timeout():
	add_ghost()
	
func _set_health():
	health_bar.health = health
	

	
func get_coin():
	Global.coins += 1 


func get_hit():
	
	if damage_delay == 0:
		damage_delay += 1
		health -= 1
		camera_2d.apply_shake(1)
		health_bar.set_health(health)
		await get_tree().create_timer(1).timeout
		damage_delay -= 1


	




func _on_restart_button_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = false
	get_tree().reload_current_scene()
	
	$GameOver.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	



func _on_start_button_pressed() -> void:
	$start.visible = false
	get_tree().paused = false
