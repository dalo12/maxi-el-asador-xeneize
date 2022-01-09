extends Moneda

var nombre = "pan"

func _ready():
	emit_signal("created", nombre)

func _on_body_entered(body):
	._on_body_entered(body)
	emit_signal("eatten", nombre)
