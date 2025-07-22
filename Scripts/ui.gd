extends CanvasLayer

class_name UI

@onready var lifes_label: Label = %LifesLabel

func set_lifes(lifes: int):
	lifes_label.text = "Lifes: %d" % lifes
	
