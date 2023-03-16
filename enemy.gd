extends CharacterBody2D


@export var target: Node2D
@export var speed: float
@onready var agent := $NavigationAgent2D as NavigationAgent2D


func _ready() -> void:
	retarget()


func _physics_process(_delta: float) -> void:
	var direction = to_local(agent.get_next_path_position()).normalized()
	velocity = direction * speed
	move_and_slide()


func retarget() -> void:
	agent.target_position = target.global_position


func _on_timer_timeout() -> void:
	retarget()
