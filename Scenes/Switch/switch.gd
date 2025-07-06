extends StaticBody2D



signal switch_activated
signal switch_deactivated

var can_interact: bool = false
var is_activated: bool = false


func _process(delta: float) -> void:
	
	if switch_has_been_interacted_with():
		print("The Player interacted with the switch!")
		if is_activated:
			deactivate_switch()
		else:
			activate_switch()
			
func deactivate_switch() -> void:
	
	$AnimatedSprite2D.play("deactivated")
	switch_deactivated.emit()
	is_activated = false

func activate_switch() -> void:
	
	$AnimatedSprite2D.play("activated")
	switch_activated.emit()
	is_activated = true

func switch_has_been_interacted_with() -> bool:
	return Input.is_action_just_pressed("interact") and can_interact
