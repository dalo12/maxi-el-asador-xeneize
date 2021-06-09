extends Actor

func _ready() -> void:
	setear_textura()
	set_physics_process(false)
	_velocity.x = -speed.x

func _on_StompDetector_body_entered(body):
	if (body.global_position.y > get_node("StompDetector").global_position.y):
		return #nada, es para que haya un delay
	get_node("CollisionShape2D").disabled = true
	queue_free()


func _physics_process(delta) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

# Le asigna una textura al azar (entre las cuatro texturas disponibles) al enemigo
func setear_textura() -> void:
	var arreglo_texturas = [
		preload("res://assets/salad-ind.png"), 
		preload("res://assets/salad-riv.png"),
		preload("res://assets/salad-rac.png"),
		preload("res://assets/salad-sl.png")
	]
	randomize()
	# var i:int = randi() % 4  
	get_node("enemy").set_texture(arreglo_texturas[randi() % 4])
