extends ProgressBar



#@onready var timer = $Timer
var health = 0
var prev_health = 0
var took_damage = false
var damage_values = 0

@onready var health_bar: ProgressBar = $"."
@onready var damage_bar: ProgressBar = $Damage_Bar
@onready var timer: Timer = $Timer






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_health(health)
	health_bar.max_value = damage_values
	damage_bar.max_value = damage_values
	if took_damage == true:
		if health_bar.value > value:
			health_bar.value -= 0.5
		else:
			took_damage = false
	
	

func init_health(_health):
	damage_values = _health
	health = _health
	print(health)
	max_value = health
	value = health
	print(max_value)
	
	 
func set_health(new_health):
	prev_health = health
	health = new_health
	value = health
	took_damage = true
	
	
		
	if health < prev_health:
		timer.start()
	
	


func _on_timer_timeout():
	damage_bar.value = value
