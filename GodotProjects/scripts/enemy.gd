extends CharacterBody2D

var health = 10
var inrange = false
var hit = false

func setisinrange(inrangee):
	inrange = inrangee

func isinrange():
	if (inrange == true):
		print("in range")
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	isinrange()
	pass
