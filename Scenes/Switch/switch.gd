extends StaticBody2D



signal activated(switch_name: String)
signal deactivated(switch_name: String)

var can_interact: bool = false
var is_activated: bool = false


func _process(delta: float) -> void:
	
	if has_been_interacted_with():
		print("The Player interacted with the switch!")
		if is_activated:
			deactivate_switch()
		else:
			activate_switch()
			
func deactivate_switch() -> void:
	
	$AnimatedSprite2D.play("deactivated")
	deactivated.emit(self.name)
	is_activated = false

func activate_switch() -> void:
	
	$AnimatedSprite2D.play("activated")
	activated.emit(self.name)
	is_activated = true

func has_been_interacted_with() -> bool:
	return Input.is_action_just_pressed("interact") and can_interact
