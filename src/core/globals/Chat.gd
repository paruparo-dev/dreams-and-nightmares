extends Node


signal message_sent(message: String)


func send(message: Variant, source: Variant) -> void:
	var msg : String = "%s>>>%s" % [str(source), str(message)]
	
	message_sent.emit(msg)


func announce(message: Variant) -> void:
	var msg : String = str(message)
	
	message_sent.emit(msg)
