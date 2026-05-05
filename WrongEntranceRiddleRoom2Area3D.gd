extends Area3D

@onready var player = $"../../Player"
#@onready var player_respawn_point =  $"../../PlayerRestartPoint"
@onready var player_restart_point = $"../../PlayerRestartPoint"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_body_entered(body):
	
	if body.name == "Player":
		print("body entered")
		player.position = player_restart_point.position
		player.rotation = player_restart_point.rotation
		
