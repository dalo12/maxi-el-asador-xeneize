extends Moneda

var nombre = "pollo"

func _ready():
	get_parent().incrementar_total(nombre)

func _on_body_entered(body):
	._on_body_entered(body)
	get_parent().incrementar_win(nombre)
