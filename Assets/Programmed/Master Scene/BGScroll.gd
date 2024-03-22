extends Control

# Scroll speed in pixels per second (negative for right-to-left movement)
var scroll_speed = -30  # Decreased speed for a slower scroll

# References to the TextureRect nodes
@onready var sky_bg = $SkyBG
@onready var sky_bg_2 = $SkyBG2

# Width of the background image
var background_width = 5952  # Replace with your actual texture width if different

func _ready():
	# Initialize the position of the second SkyBG
	sky_bg_2.position.x = background_width

func _process(delta):
	# Move both SkyBG nodes
	sky_bg.position.x += scroll_speed * delta
	sky_bg_2.position.x += scroll_speed * delta

	# Check if sky_bg has moved completely out of view
	if sky_bg.position.x < -background_width:
		sky_bg.position.x = sky_bg_2.position.x + background_width

	# Check if sky_bg_2 has moved completely out of view
	if sky_bg_2.position.x < -background_width:
		sky_bg_2.position.x = sky_bg.position.x + background_width
