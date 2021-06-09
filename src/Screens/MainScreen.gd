extends Control

func _ready() -> void:
	ocultar_creditos()

func mostrar_creditos():
	get_node("Panel").visible = true

func ocultar_creditos():
	get_node("Panel").visible = false
