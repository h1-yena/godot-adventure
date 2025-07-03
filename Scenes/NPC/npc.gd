extends StaticBody2D

var can_interact: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_interact:
		
		print(self.name + ": Action pressed!")
		
		if $DialogCanvas.visible:
			$DialogCanvas.visible = false
		else:
			$DialogCanvas.visible = true
