extends Moneda

var nombre = "vacio"

func _ready():
	emit_signal("created", nombre)
	#get_parent().incrementar_total(nombre)

func _on_body_entered(body):
	._on_body_entered(body)
	emit_signal("eatten", nombre)
	#get_parent().incrementar_win(nombre)
