extends Node
signal moved

enum DIRECTIONS {
	LEFT,
	RIGHT,
	UP,
	DOWN
}

var mousePosOnClick : Vector2
var mousePosOnRelease : Vector2
var mouseTimeOnClick : int
var mouseTimeOnRelease : int

var mouseSwipeDist : float
var mouseSwipeTime : int
var mouseSwipeSensitivity : float = 30000
var mouseSwipeTimeLimit : int = 800
var mouseSwipeDir : Vector2
 
var isMouseSwipeDistGood : bool
var isMouseSwipeTimeGood : bool

func _unhandled_input(event) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("ui_left"):
			emit_signal("moved", DIRECTIONS.LEFT)
		elif event.is_action_pressed("ui_right"):
			emit_signal("moved", DIRECTIONS.RIGHT)
		elif event.is_action_pressed("ui_up"):
			emit_signal("moved", DIRECTIONS.UP)
		elif event.is_action_pressed("ui_down"):
			emit_signal("moved", DIRECTIONS.DOWN)
#	elif event is InputEventMouseButton:
	if event.is_action_pressed("mouse_left"):
		mousePosOnClick = get_viewport().get_mouse_position()
		mouseTimeOnClick = Time.get_ticks_msec()
		print("click left at ", mousePosOnClick, " at ", mouseTimeOnClick)
	elif event.is_action_released("mouse_left"):
		mousePosOnRelease = get_viewport().get_mouse_position()
		mouseTimeOnRelease = Time.get_ticks_msec()
		
		print("release left at ", mousePosOnRelease, " at ", mouseTimeOnRelease)
		
#		mouseSwipeDir =
		print(angle_to_point())
		mouseSwipeDist = mousePosOnClick.distance_squared_to(mousePosOnRelease)
		mouseSwipeTime = mouseTimeOnRelease - mouseTimeOnClick
		print("swipe dist at ", mouseSwipeDist)
		print("swipe time at ", mouseSwipeTime)
		
		isMouseSwipeDistGood = mouseSwipeSensitivity < mouseSwipeDist
		isMouseSwipeTimeGood = mouseSwipeTimeLimit > mouseSwipeTime
		
		print("is swipe dist enough? ", isMouseSwipeDistGood)
		print("is swipe time short enough? ", isMouseSwipeTimeGood)

		print("\n")
