extends Node2D

@onready var ray_cast_right = $RayCastRight
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var sword_sprite = $Sword/SwordSprite
@onready var hit_box = $frontHitBox
@onready var hit_sense = $hitSense

const SPEED = 60
var direction = 1

func _ready():
	self.set_physics_process(true)
	#animated_sprite.play("run")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1 if direction == 1 else 1
		self.scale.x = -1 if self.scale.x == 1 else 1
	
	position.x += direction * SPEED * delta

#check that the player and the animation are in the area and will kill player
func _on_front_hit_box_body_entered(body: Node2D) -> void:
	if body.name == "Player" and animation_player.current_animation == "swing":
		print("You died!")
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		await get_tree().create_timer(1.0).timeout
		get_tree().reload_current_scene()

# check for the player and plays the animation
func _on_hit_sense_body_entered(body: Node2D) -> void:
	if body.name == "Player" and animation_player.current_animation != "swing":
		animation_player.stop()
		animation_player.play("swing")
