extends Node2D

@onready var timer = $Timer
@onready var ghost_timer: Timer = $"../GhostTimer"

const dash_delay = 0.4
var can_dash = true
var stopped = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	is_dashing()
	
func start_dash(duration):
	timer.wait_time = duration
	timer.start()
	
	
func is_dashing():
	return !timer.is_stopped()
	

func end_dash():
	can_dash = false
	await(get_tree().create_timer(dash_delay))
	can_dash = true


func _on_timer_timeout() -> void:
	end_dash()
