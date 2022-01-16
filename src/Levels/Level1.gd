extends Node2D

var coins_total = {}
var coins_win = {}
var victory:bool = false
var once:bool = true
var defeat:bool = false

func _process(delta):
	actualizar_panel()
	verificar_victoria()
	if victory:
		if(once):
			once = false
			victoria()
		transicion_escena(delta)
	else:
		if defeat:
			transicion_escena(delta)

# Registra cuando una moneda es creada		
func incrementar_total(key: String) -> void:
	if(coins_total.has(key)):
		coins_total[key] = coins_total[key] + 1
	else:
		coins_total[key] = 1
		coins_win[key] = 0

# Registra cuando una moneda es comida		
func incrementar_win(key: String) -> void:
	if(coins_win.has(key)):
		coins_win[key] = coins_win[key] + 1

# Actualiza el panel de los recursos comidos/pendientes
func actualizar_panel():
	var texto:String = ""

	for k in coins_total.keys():
		texto += str(k, ": ", coins_win[k], "/", coins_total[k], "\n")

	get_node("OverLayer/Recursos").set_text(texto)

# Verifica si el jugador alcanza la victoria
func verificar_victoria():
	var razon = 1
	for i in coins_total.keys():
		razon *= coins_win[i] / coins_total[i]
	if(razon == 1):
		victory = true
		
func transicion_escena(delta:float):
	get_node("OverLayer/BlackRect").modulate.a += 0.4 * delta

# Ejecuta la secuencia de victoria
func victoria():
	print("VICTORIA!")
	$BackgroundMusic.stop()
	$VictorySound.play()
	get_node("OverLayer/Win").set_visible(true)

# Captura la señal de cuando el jugador muere
func _on_Player_player_died():
	defeat = true
	$DeadSound.play()
	$BackgroundMusic.stop()

# Captura la señal de cuando una moneda es creada
func _on_Coin_created(coin_name):
	incrementar_total(coin_name)
	
# Captura la señal de cuando una moneda es comida
func _on_Coin_eatten(coin_name):
	incrementar_win(coin_name)


