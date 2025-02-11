extends CharacterBody2D


var attack: bool = false
var speed: int = 200


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	var player = $"../Player"
	var direction = (player.position - self.position).normalized()
	
	if attack == true:
		velocity.x = direction.x * speed
		print(direction.x)
	else:
		velocity.x = 0 
	
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		attack = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		attack = false
