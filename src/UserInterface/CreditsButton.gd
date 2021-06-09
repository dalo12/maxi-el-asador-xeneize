extends Button

func _on_button_up():
	get_owner().get_node("Panel").visible = true
