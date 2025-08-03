extends Control

@onready var item_name_label = $PanelContainer/MarginContainer/VBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/ItemNameLabel
@onready var description_label = $PanelContainer/MarginContainer/VBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/DescriptionLabel
@onready var price_number = $PanelContainer/MarginContainer/VBoxContainer/PanelContainer2/MarginContainer/VBoxContainer/HBoxContainer/PriceNumber
@onready var buy_button = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/BuyButton

var cost : int = 0
var selected_item : String = ''

func _ready():
	Global.shop_screen = self

func _on_apple_button_pressed():
	item_name_label.text = "Delicious Apple"
	description_label.text = "A crisp, juicy apple that eases hunger and keeps you going."
	price_number.text = '15'
	cost = 15
	selected_item = "apple"
	buy_button.disabled = false

func _on_potion_button_pressed():
	item_name_label.text = "Refreshing Elixir"
	description_label.text = "A simple drink that cools you down, offering nothing but a moment of refreshment"
	price_number.text = '10'
	cost = 10
	selected_item = "potion"
	buy_button.disabled = false



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



func _on_visibility_changed():
	if visible:
		buy_button.disabled = true
