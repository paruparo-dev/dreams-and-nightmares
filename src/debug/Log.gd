extends RefCounted

class_name Log


var message : String
var source : String


func src(value: Variant = "Debug") -> Log:
	source = str(value)
	
	return self


func line(value: Variant) -> Log:
	message += "[%s] %s\n" % [source, str(value)]

	return self


func dict(data: Dictionary) -> Log:
	for key in data:
		message += "[%s] %s: %s\n" % [source, key, data[key]]

	return self
