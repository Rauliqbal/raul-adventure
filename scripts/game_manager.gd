extends Node

var current_level = 0
var level_path = "res://scenes/levels/"
var coin = 0

func next_level():
	current_level += 1
	var full_path = level_path + "level" + str(current_level) + ".tscn"
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file(full_path)
	print("Change level scene")
	print(full_path)
	

func set_up_area():
	reset_coin()

func add_coin():
	coin += 1
	if coin >= 4:
		var portal = get_tree().get_first_node_in_group("area_exits") as PortalExit
		portal.open()

func reset_coin():
	coin = 0
