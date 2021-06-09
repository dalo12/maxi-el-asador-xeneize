extends Node2D

var coins_total = {}
var coins_win = {}

func _process(delta):
	actualizar_panel()
	verificar_victoria()

	
func incrementar_total(key: String) -> void:
	if(coins_total.has(key)):
		coins_total[key] = coins_total[key] + 1
	else:
		coins_total[key] = 1
		coins_win[key] = 0

func incrementar_win(key: String) -> void:
	if(coins_win.has(key)):
		coins_win[key] = coins_win[key] + 1

func actualizar_panel():
	var texto:String = ""

	for k in coins_total.keys():
		texto += str(k, ": ", coins_win[k], "/", coins_total[k], "\n")

	get_node("CapaRecursos/Recursos").set_text(texto)

func verificar_victoria():
	var razon = 1
	for i in coins_total.keys():
		razon *= coins_win[i] / coins_total[i]
	if(razon == 1):
		get_node("CapaRecursos/Win").visible = true
