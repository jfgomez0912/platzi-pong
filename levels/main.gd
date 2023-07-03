extends Node2D


var PlayerScore = 0
var OpponentScore = 0


func restart_game():
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960, 540)
	$CountDown.visible = true
	$RestartTimer.start()


func _ready():
	restart_game()


func _process(_delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountDown.text = str(int($RestartTimer.time_left) + 1)


func _on_player_goal_body_entered(body):
	if body == $Ball:
		OpponentScore += 1
		restart_game()


func _on_opponent_goal_body_entered(body):
	if body == $Ball:
		PlayerScore += 1
		restart_game()


func _on_restart_timer_timeout():
	$RestartTimer.stop()
	$CountDown.visible = false
	$Ball.reset_ball()
