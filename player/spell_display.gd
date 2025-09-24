extends Node2D
@onready var circle: Sprite2D = $circle
@onready var displayed_spell: AnimatedSprite2D = $displayed_spell

var spell = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	displayed_spell.play(Global.current_spell)
