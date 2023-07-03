extends CharacterBody2D


var speed = 0
var direction = Vector2.ZERO


func reset_ball():
	speed = 600
	direction.x = [-1, 1].pick_random()
	direction.y = [-0.8, 0.8].pick_random()


func _physics_process(delta):
	var collide = move_and_collide(direction * speed * delta)

	if collide:
		$AudioStreamPlayer.play()
		direction = direction.bounce(collide.get_normal())
