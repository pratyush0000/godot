extends CharacterBody2D

var SPEED = 100
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var player


func _physics_process(delta):
	#for frog gavity
	velocity.y += gravity * delta
	if chase == true:
		get_node("AnimatedSprite2D").play("Jump")
		player = get_node("../../PlayerNode/Player")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		get_node("AnimatedSprite2D").play("Idle")
		velocity.x = 0
	
	
	move_and_slide()


func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true
		#print(player.global_position)




func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false
