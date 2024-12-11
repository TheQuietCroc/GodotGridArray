@tool
extends EditorPlugin

var plugin

func _enter_tree() -> void:
	if (plugin == null):
		plugin = GridArrayInspector.new()
	
	add_inspector_plugin(plugin)


func _exit_tree() -> void:
	remove_inspector_plugin(plugin)
