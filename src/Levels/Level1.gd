extends Node2D

var coins_total = {}
var coins_win = {}


func _init():
	coins_total = {
		"bife" : 0,
		"chori" : 0,
		"pan" : 0,
		"pollo" : 0,
		"vacio" : 0,
	}

	coins_win = {
		"bife" : 0,
		"chori" : 0,
		"pan" : 0,
		"pollo" : 0,
		"vacio" : 0,
	}

func _process(delta):
	actualizar_panel()
	verificar_victoria()

	
func incrementar_total(key: String) -> void:
	if(coins_total.has(key)):
		coins_total[key] = coins_total[key] + 1

func incrementar_win(key: String) -> void:
	if(coins_win.has(key)):
		coins_win[key] = coins_win[key] + 1

func actualizar_panel():
	var recursos: = get_node("CapaRecursos/Recursos")
	recursos.text = ""
	recursos.text += str("Bife: ", coins_win["bife"], "/", coins_total["bife"])
	recursos.text += str("\nChori: ", coins_win["chori"], "/", coins_total["chori"])
	recursos.text += str("\nPan: ", coins_win["pan"], "/", coins_total["pan"])
	recursos.text += str("\nPollo: ", coins_win["pollo"], "/", coins_total["pollo"])
	recursos.text += str("\nVacio: ", coins_win["vacio"], "/", coins_total["vacio"])

func verificar_victoria():
	var razon = 1
	for i in coins_total.keys():
		razon *= coins_win[i] / coins_total[i]
	if(razon == 1):
		get_node("CapaRecursos/Win").visible = true
