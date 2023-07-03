extends CharacterBody2D


const SPEED = 400


func _physics_process(_delta):
	var direction = Input.get_axis("ui_up", "ui_down")
	velocity.y = direction * SPEED
	move_and_slide()
