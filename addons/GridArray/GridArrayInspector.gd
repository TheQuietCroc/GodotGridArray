extends EditorInspectorPlugin
class_name GridArrayInspector

func _can_handle(object: Object) -> bool:
	return true
	
func _parse_property(object: Object, type: Variant.Type, name: String, hint_type: PropertyHint, hint_string: String, usage_flags: int, wide: bool) -> bool:
	if (!name.to_lower().contains("metadata")):
		const NAME_KEYWORDS = ["gridarray", "grid_array"]
		
		if (type == TYPE_ARRAY):
			for keyword in NAME_KEYWORDS:
				if (name.to_lower().contains(keyword)):
					add_property_editor(name, GridArrayProperty.new())
					
					return true
	
	return false
