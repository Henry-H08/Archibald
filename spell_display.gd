extends Node2D
@onready var circle: Sprite2D = $circle
@onready var displayed_spell: Sprite2D = $displayed_spell

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	displayed_spell.frame = Global.current_spell
