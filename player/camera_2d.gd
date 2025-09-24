extends Camera2D

@export var random_strength: float = 0.2
@export var shake_fade: float = 10
var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0
var strength_multi = 1

func _ready() -> void:
	pass

func apply_shake(multi):
	strength_multi = multi
	shake_strength = random_strength * strength_multi




func _process(delta: float) -> void:
	
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_fade * delta)

		offset = random_offset()
func random_offset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
