extends StaticBody2D

var can_interact: bool = false
@export var dialog_lines: Array[String] = ["Hello", "What\'s up?", "Sayonara!"]
var dialog_index: int = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_interact:
		if dialog_index < dialog_lines.size():
			$DialogCanvas.visible = true
			get_tree().paused = true

			$DialogCanvas/DialogBox/DialogText.text = dialog_lines[dialog_index]
			dialog_index += 1 
		else:
			
			$DialogCanvas.visible = false
			get_tree().paused = false
			dialog_index = 0
		
