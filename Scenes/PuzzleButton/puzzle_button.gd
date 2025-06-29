extends Area2D

var bodies_on_button: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("pushable") or body is Player:
		$AnimatedSprite2D.play("pressed")
		bodies_on_button += 1
		print("I have been pressed!")
		


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("pushable") or body is Player:
		bodies_on_button -= 1
		if bodies_on_button == 0:
			$AnimatedSprite2D.play("unpressed")
			print("I am no longer being pressed!")
