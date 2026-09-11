extends Node
	

signal message_logged(message: String)


func log(new_log: Log) -> void:
	print(new_log.message)
	message_logged.emit(new_log.message)
	