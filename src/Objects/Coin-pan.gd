extends Moneda

var nombre = "pan"

func _ready():
	print(get_parent())
	get_parent().incrementar_total(nombre)

func _on_body_entered(body):
	._on_body_entered(body)
	get_parent().incrementar_win(nombre)
