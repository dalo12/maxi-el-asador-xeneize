extends Area2D
class_name Moneda

onready var animation_player:AnimationPlayer = get_node("AnimationPlayer")

func _on_body_entered(body):
	animation_player.play("fade_out")
