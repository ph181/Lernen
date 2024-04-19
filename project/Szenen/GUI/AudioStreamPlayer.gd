extends AudioStreamPlayer

var musicplay = true

func _ready():
	pass
# Function to stop the music
func stop_music():
	stop()
	musicplay = false
	

# Function to start the music
func start_music():
	play()
	musicplay = true
