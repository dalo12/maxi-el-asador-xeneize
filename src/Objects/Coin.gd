extends Area2D
class_name Moneda

onready var animation_player:AnimationPlayer = get_node("AnimationPlayer")
onready var audio_player:AudioStreamPlayer2D = get_node("Sonido_comer")

func _on_body_entered(body):
	print(audio_player)
	print(animation_player)
	audio_player.play(0.0)
	animation_player.play("fade_out")
