extends Node3D

# @onready var background_music_node = $BackgroundMusic
@export var no_of_chances := 3


# Called when the node enters the scene tree for the first time.
func _ready():
	# background_music_node.stream.loop = true
	# background_music_node.play()
	var chances_left_label = get_node("UI/ChancesLeft")
	chances_left_label.text = "Chances Left: " + str(no_of_chances)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_wrong_entrance_area_3d_2_body_entered(body):
	print("chance lost")
	var chances_left_label = get_node("UI/ChancesLeft")
	var game_over_label = get_node("UI/GameOver")

	if body.name == "Player" and no_of_chances > 1:
		no_of_chances = no_of_chances - 1

		chances_left_label.text = "Chances Left: " + str(no_of_chances)
	elif body.name == "Player" and no_of_chances <= 1:
		chances_left_label.hide()
		#game_over_label.text =  "Game Over - You failed to escape"
		#game_over_label.show()

		#show gameover screen
		get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")


func _on_wrong_entrance_area_3d_body_entered(body):
	print("chance lost")
	var chances_left_label = get_node("UI/ChancesLeft")
	var game_over_label = get_node("UI/GameOver")

	if body.name == "Player" and no_of_chances > 1:
		no_of_chances = no_of_chances - 1

		chances_left_label.text = "Chances Left: " + str(no_of_chances)
	elif body.name == "Player" and no_of_chances <= 1:
		chances_left_label.hide()


func _on_right_entrance_area_3d_body_exited(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/level_completed_screen.tscn")
#		game_over_label.text =  "Game Over - You failed to escape"
#		game_over_label.show()
#show gameover screen
# get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")
