extends CharacterBody2D


@onready var anim = $AnimatedSprite2D

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
		anim.play("Run")
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = 0 
		anim.play("Idle")
		
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		attack = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		attack = false
