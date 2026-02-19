extends CanvasLayer
@onready var stat_menu: CanvasLayer = $"../stat_menu"
var current_menu = "closed"
@onready var settings_menu: CanvasLayer = $"../settings_menu"
@onready var spells_menu: CanvasLayer = $"../spells_menu"

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("open_menu"):
		if current_menu == "closed":
			visible = true
			current_menu = "stat"
			get_tree().paused = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			visible = false
			current_menu = "closed"
			get_tree().paused = false
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if current_menu == "stat":
			stat_menu.visible = true
	else:
		stat_menu.visible = false
	if current_menu == "settings":
		settings_menu.visible = true
	else:
		settings_menu.visible = false
	if current_menu == "spells":
		spells_menu.visible = true
	else:
		spells_menu.visible = false


func _on_stat_mark_button_pressed() -> void:
	if current_menu != "stat":
			stat_menu.visible = true
			current_menu = "stat"
	


func _on_settings_mark_button_pressed() -> void:
	if current_menu != "settings":
			settings_menu.visible = true
			current_menu = "settings"
			


func _on_spells_mark_button_pressed() -> void:
	if current_menu != "spells":
			spells_menu.visible = true
			current_menu = "spells"
			
