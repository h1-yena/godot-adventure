extends StaticBody2D

var can_interact: bool = false
var dialog_lines: Array[String] = ["Hello", "What\'s up?", "Sayonara!"]

func _ready() -> void:
	
	for value in dialog_lines:
		print(value)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_interact:
		
		print(self.name + ": Action pressed!")
		
		if $DialogCanvas.visible:
			$DialogCanvas.visible = false
			get_tree().paused = false
		else:
			$DialogCanvas.visible = true
			get_tree().paused = true
