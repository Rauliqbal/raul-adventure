extends Area2D
class_name PortalExit

@onready var sprite = $AnimatedSprite2D
@onready var portal_sfx = $AudioStreamPlayer2D

var is_open = false

func _ready():
	close()
	
func open():
	is_open = true
	sprite.visible = true
	portal_sfx.playing = true
	
func close():
	is_open = false
	#sprite.region_rect.position.x = 0
	sprite.visible = false
	portal_sfx.playing = false
	

func _on_body_entered(body: Node2D) -> void:
	if is_open && body is PlayerController: 
		GameManager.next_level()
		
