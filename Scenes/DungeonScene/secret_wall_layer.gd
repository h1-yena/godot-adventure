extends TileMapLayer

var switch_1_is_enabled: bool = false
var switch_4_is_enabled: bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func disable_secret_wall() -> void:
	visible = false
	collision_enabled = false
	
func enable_secret_wall() -> void:
	visible = true
	collision_enabled = true


func _on_switch_activated(switch_name:String) -> void:
	if switch_name == "Switch1":
		switch_1_is_enabled = true
	elif switch_name == "Switch4":
		switch_4_is_enabled = true
	
	if switch_1_is_enabled and switch_4_is_enabled:
		disable_secret_wall()

func _on_switch_deactivated(switch_name:String) -> void:
	if switch_name == "Switch1":
		switch_1_is_enabled = false
		print("Switch 1 has been enabled!")
	elif switch_name == "Switch4":
		switch_4_is_enabled = false
		print("Switch 4 has been enabled!")
		
	
	if !switch_1_is_enabled or !switch_4_is_enabled:
		enable_secret_wall()
		print("Walls enabled!")
