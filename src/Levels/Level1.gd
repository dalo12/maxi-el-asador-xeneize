extends Node2D

var coins_total = {}
var coins_win = {}
var victory:bool = false

func _process(delta):
	actualizar_panel()
	verificar_victoria()
	if victory:
		transicion_escena(delta)
	
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

	get_node("OverLayer/Recursos").set_text(texto)

func verificar_victoria():
	var razon = 1
	for i in coins_total.keys():
		razon *= coins_win[i] / coins_total[i]
	if(razon == 1):
		victory = true
		$BackgroundMusic.stop()
		$VictorySound.play()
		get_node("OverLayer/Win").set_visible(true)
		
func transicion_escena(delta:float):
	get_node("OverLayer/BlackRect").modulate.a += 0.4 * delta


func _on_Player_player_died():
	$DeadSound.play()
	$BackgroundMusic.stop()

func _on_Coin_created(coin_name):
	incrementar_total(coin_name)
	
func _on_Coin_eatten(coin_name):
	incrementar_win(coin_name)
