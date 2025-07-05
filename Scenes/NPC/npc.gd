extends StaticBody2D

var can_interact: bool = false
@export var dialog_lines: Array[String] = ["Hello", "What\'s up?", "Sayonara!"]
var dialog_index: int = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_interact:
		
		$DialogCanvas.visible = true
		get_tree().paused = true
		
		
		if dialog_index < dialog_lines.size()-1:
			$DialogCanvas/DialogBox/DialogText.text = dialog_lines[dialog_index]
			dialog_index += 1 
		else:
			$DialogCanvas/DialogBox/DialogText.text = dialog_lines[dialog_index]
			$DialogCanvas.visible = false
			get_tree().paused = false
			dialog_index = 0
		

		#if dialog_index == dialog_lines.size() - 1:
		#	$DialogCanvas.visible = false
		#	get_tree().paused = false
						
