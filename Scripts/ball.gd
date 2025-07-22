extends CharacterBody2D

class_name Ball

const VELOCITY_LIMIT = 40

@export var ball_speed = 20
@export var lifes = 3
@export var death_zone: DeathZone

var speed_up_factor = 1.05

@onready var collision_shape_2d = $CollisionShape2D

var start_position: Vector2

func _ready():
	start_position = position
	death_zone.life_lost.connect(on_life_lost)
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * ball_speed * delta)	
	if(!collision):
		return
	
	velocity = velocity.bounce(collision.get_normal())

func start_ball():
	position = start_position
	randomize()
	
	velocity = Vector2(randf_range(-1, 1), randf_range(-.1, -1)).normalized() * ball_speed
	
func on_life_lost():
	lifes -=1
	if lifes==0:
		pass
		#game over
	else:
		reset_ball()

func reset_ball():
	position = start_position
	velocity = Vector2.ZERO
