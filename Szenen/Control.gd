extends Control

var questions = [
	"What is the capital of France?",
	"What year did World War II end?",
	"Who painted the Mona Lisa?"
]

var options = [
	["London", "Paris", "Berlin"],
	["1945", "1939", "1941"],
	["Leonardo da Vinci", "Pablo Picasso", "Vincent van Gogh"]
]

var answers = [1, 0, 0]

var currentQuestion = 0
var score = 0


func displayQuestion():
	questionLabel.text = questions[currentQuestion]
	optionButton1.text = options[currentQuestion][0]
	optionButton2.text = options[currentQuestion][1]
	optionButton3.text = options[currentQuestion][2]

func checkAnswer(selectedOption):
	if selectedOption == answers[currentQuestion]:
		score += 1
	currentQuestion += 1
	if currentQuestion < len(questions):
		displayQuestion()
	else:
		showFinalScore()

func showFinalScore():
	# You can display the final score or perform any other action here.
	print("Quiz completed! Final score: " + str(score))



func _ready():
	displayQuestion()
