extends Control

@onready var item_name_label = $PanelContainer/MarginContainer/VBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/ItemNameLabel
@onready var description_label = $PanelContainer/MarginContainer/VBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/DescriptionLabel
@onready var price_number = $PanelContainer/MarginContainer/VBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/HBoxContainer/PriceNumber
var cost : int = 0
var selected_item : String = ''

func _ready():
	Global.shop_screen = self

func _on_apple_button_pressed():
	item_name_label.text = "Delicious Apple"
	description_label.text = "This apple gives +25% Move Speed for 90 seconds"
	price_number.text = '10'
	cost = 10
	selected_item = "apple"

func _on_potion_button_pressed():
	item_name_label.text = "Potion of the Giant"
	description_label.text = "This potion makes you bigger for 90 seconds"
	price_number.text = '15'
	cost = 15
	selected_item = "potion"



func _on_close_button_pressed():
	visible = false


func _on_buy_button_pressed():
	match selected_item:
		"apple":
			print("apple bought")
			Global.coins -= cost
			Global.player.itemanimation.animation = "apple"
		"potion":
			print("potion bought")
			Global.coins -= cost
			Global.player.itemanimation.animation = "potion"
	Global.player.idle_state.use_item()
	visible = false
