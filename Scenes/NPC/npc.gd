extends StaticBody2D



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		
		print(self.name + ": Action pressed!")
		
		if $DialogCanvas.visible == false:
			$DialogCanvas.visible = true
		else:
			$DialogCanvas.visible = false
