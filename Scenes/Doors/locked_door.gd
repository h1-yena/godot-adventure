extends StaticBody2D


func _on_puzzle_button_pressed() -> void:
	print(self.name + ": Signal received! Button pressed!")
	visible = false
	$CollisionShape2D.set_deferred("disabled", true)


func _on_puzzle_button_unpressed() -> void:
	print(self.name + ": Signal received! Button unpressed!")
	visible = true
	$CollisionShape2D.set_deferred("disabled", false)
