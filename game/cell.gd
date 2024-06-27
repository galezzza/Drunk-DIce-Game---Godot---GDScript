class_name Cell_Statistic extends Node

var _task: String
var _additional_description: String

func get_task():
	return self._task

func get_additional_description():
	return self._additional_description


func _init(task: String, additional_description: String):
	self._task = task
	self._additional_description = additional_description
