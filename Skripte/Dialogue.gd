class Dialogue:
	var options = []

	func add_option(text, response):
		options.append({"text": text, "response": response})

	func get_options():
		return options

# Example dialogue
var dialogue = Dialogue.new()
dialogue.add_option("What is this place?", "This is a classroom, where you can learn and explore.")
dialogue.add_option("Can you help me build a Rocket_Horse?", "Sure, let me show you how.")
dialogue.add_option("How do I use the saw?", "The saw is used to cut materials. Just place the material on a flat surface and saw along the line where you want to cut.")
dialogue.add_option("How do I use the hammer?", "The hammer is used to drive nails into materials. Hold the nail and hit it with the hammer to drive it into the material.")
dialogue.add_option("Goodbye", "Goodbye, have a great day!")
