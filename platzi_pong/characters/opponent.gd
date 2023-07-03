extends CharacterBody2D


const SPEED = 400


@onready var ball = get_parent().find_child("Ball")


func get_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		else:
			return -1
	else:
		return 0


func _physics_process(_delta):
	var direction = get_direction()
	velocity.y = direction * SPEED
	move_and_slide()
