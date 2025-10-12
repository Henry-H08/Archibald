extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect
@onready var points: Label = $ColorRect/points
@onready var attack_speed_num: Label = %attack_speed_num
@onready var attack_speed_button_1: Button = %attack_speed_button1
@onready var attack_speed_button_2: Button = %attack_speed_button2

var stat_menu_open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	points.text = "pts: " + str(Global.points)
	attack_speed_num.text = str(Global.attack_speed)
	
	if Input.is_action_just_pressed("open_stats"):
		if stat_menu_open == false:
			visible = true
			stat_menu_open = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().paused = true
			
			
		else: 
			visible = false
			stat_menu_open = false
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			get_tree().paused = false


func _on_attack_speed_button_pressed() -> void:
	if Global.points >= 1:
		Global.attack_speed += 0.05
		Global.points -= 1
