extends CharacterBody2D
class_name Player
@export var move_speed: float = 100
@export var push_strength: float = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if SceneManager.player_spawn_position != Vector2(0,0):
		position = SceneManager.player_spawn_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	move_player()
	move_pushable()
	move_and_slide()

func move_player() -> void:
	var move_vector: Vector2 = \
	 Input.get_vector("move_left","move_right","move_up","move_down")
	
	velocity = move_vector * move_speed
	
	if velocity.x > 0:
		#print("The player is moving right!")
		$AnimatedSprite2D.play("move_right")
		$InteractableArea.position = Vector2(5,0)
	elif velocity.x < 0:
		#print("The player is moving left!")
		$AnimatedSprite2D.play("move_left")
		$InteractableArea.position = Vector2(-5,0)
	elif velocity.y > 0:
		#print("The player is moving down!")
		$AnimatedSprite2D.play("move_down")
		$InteractableArea.position = Vector2(0,8)
	elif velocity.y < 0:
		#print("The player is moving up!")
		$AnimatedSprite2D.play("move_up")
		$InteractableArea.position = Vector2(0,-6)
	else:
		#print("The player isn't moving.")
		$AnimatedSprite2D.stop()
	
	
func move_pushable() -> void:
	# Get the last collision
	# Check if it's the block we're colliding with
	# If it's the block, then push it.
	
	
	var collision: KinematicCollision2D = get_last_slide_collision()
	if collision:
		var collider_node = collision.get_collider()
		if collider_node.is_in_group("pushable"):
			var collision_normal: Vector2 = collision.get_normal()
			
			collider_node.apply_central_force(-collision_normal * push_strength)
		
	
	


func _on_interactable_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("interactable"):
		body.can_interact = true
		print(body.name + " has entered the interactable area!")


func _on_interactable_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("interactable"):
		body.can_interact = false
		print(body.name + " has left the interactable area!")
