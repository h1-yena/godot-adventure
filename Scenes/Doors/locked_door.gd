extends StaticBody2D

@export var required_inputs_to_open: int = 1
var current_inputs: int = 0

func _on_puzzle_button_pressed() -> void:
	print(self.name + ": Signal received! Button pressed!")
	current_inputs += 1
	
	if required_inputs_to_open <= current_inputs: 
		print(self.name + ": Input requirement reached! Opening door!")
		visible = false
		$CollisionShape2D.set_deferred("disabled", true)
		$AudioStreamPlayer.play(0)


func _on_puzzle_button_unpressed() -> void:
	print(self.name + ": Signal received! Button unpressed!")
	current_inputs -= 1
	
	if required_inputs_to_open > current_inputs:
		print(self.name + ": Not enough inputs! Closing door!")
		visible = true
		$CollisionShape2D.set_deferred("disabled", false)
