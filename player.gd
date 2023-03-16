extends CharacterBody2D


@export var speed: float
var direction: Vector2


func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	move_and_slide()


func _unhandled_input(_event: InputEvent) -> void:
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	direction = direction.normalized()
