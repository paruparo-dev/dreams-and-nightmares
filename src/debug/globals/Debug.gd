extends Node


class Log:
	var current_message : String


	func add(message: Variant, source: Variant = "Debug") -> Log:
		current_message += "[%s] %s\n" % [str(source), str(message)]
	
		return self
		
		
	func dict(source: String, data: Dictionary) -> Log:
		for key in data:
			current_message += "[%s] %s: %s\n" % [source, key, data[key]]
	
		return self


	func new_line() -> Log:
		current_message += "\n"
		
		return self


	func end() -> void:
		print(current_message)
		Debug.message_logged.emit(current_message)
	

signal message_logged(message: String)


func begin() -> Log:
	return Log.new()
	