extends Control

func _ready():
	
	visible = OS.has_touchscreen_ui_hint()

func _physics_process(delta):
	if get_node("../../").onStair:
		$up.visible = true

func _on_right_button_down():
	var action := InputEventAction.new()
	action.action = "ui_right"
	action.pressed = true
	
	Input.parse_input_event(action)

func _on_right_button_up():
	var action := InputEventAction.new()
	action.action = "ui_right"
	action.pressed = false

	Input.parse_input_event(action)

func _on_left_button_down():
	var action := InputEventAction.new()
	action.action = "ui_left"
	action.pressed = true
	
	Input.parse_input_event(action)

func _on_left_button_up():
	var action := InputEventAction.new()
	action.action = "ui_left"
	action.pressed = false
	
	Input.parse_input_event(action)

func _on_jump_button_down():
	var action := InputEventAction.new()
	action.action = "jump"
	action.pressed = true
	
	Input.parse_input_event(action)

func _on_jump_button_up():
	var action := InputEventAction.new()
	action.action = "jump"
	action.pressed = false
	
	Input.parse_input_event(action)

func _on_Lbutton_button_down():
	var action := InputEventAction.new()
	action.action = "drop"
	action.pressed = true
	
	Input.parse_input_event(action)

func _on_Lbutton_button_up():
	var action := InputEventAction.new()
	action.action = "drop"
	action.pressed = false
	
	Input.parse_input_event(action)

func _on_Kbutton_button_down():
	var action := InputEventAction.new()
	action.action = "grab"
	action.pressed = true
	
	Input.parse_input_event(action)

func _on_Kbutton_button_up():
	var action := InputEventAction.new()
	action.action = "grab"
	action.pressed = false
	
	Input.parse_input_event(action)

func _on_up_button_down():
	var action := InputEventAction.new()
	action.action = "ui_up"
	action.pressed = true
	
	Input.parse_input_event(action)

func _on_up_button_up():
	var action := InputEventAction.new()
	action.action = "ui_up"
	action.pressed = false
	
	Input.parse_input_event(action)

func _on_down_button_down():
	var action := InputEventAction.new()
	action.action = "ui_down"
	action.pressed = true
	
	Input.parse_input_event(action)

func _on_down_button_up():
	var action := InputEventAction.new()
	action.action = "ui_right"
	action.pressed = false
	
	Input.parse_input_event(action)
