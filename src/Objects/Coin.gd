extends Area2D
class_name Moneda

onready var animation_player:AnimationPlayer = get_node("AnimationPlayer")
onready var audio_player:AudioStreamPlayer2D = get_node("Sonido_comer")

signal created(coin_name)
signal eatten(coin_name)

func _ready():
	connect("created", owner, "_on_Coin_created")
	connect("eatten", owner, "_on_Coin_eatten")

func _on_body_entered(body):
	audio_player.play(0.0)
	animation_player.play("fade_out")
