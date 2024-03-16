class Quiz:
	var questions = []
	var current_question = 0
	var score = 0

	func add_question(question, answer):
		questions.append({"question": question, "answer": answer})

	func check_answer(answer):
		if questions[current_question]["answer"] == answer:
			score += 1
			return true
		else:
			return false

	func get_question():
		return questions[current_question]["question"]

	func next_question():
		current_question += 1
		if current_question >= len(questions):
			return false
		return true
