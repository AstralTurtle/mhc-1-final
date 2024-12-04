extends Label



func _process(delta):
	var str: String = ""
	str += "Last Score = " + str(ScoreManager.last) + "\n"
	str += "High score = " + str(ScoreManager.high) + "\n"
	text = str
