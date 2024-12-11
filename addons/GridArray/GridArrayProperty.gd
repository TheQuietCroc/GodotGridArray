@tool
extends EditorProperty
class_name GridArrayProperty

var columns : SpinBox
var rows : SpinBox
var grid_array_container : GridContainer
var prev_size : Vector2i

func get_values() -> Array:
	return get_edited_object().get(get_edited_property())

func set_values(new_values : Array) -> void:
	get_edited_object().set(get_edited_property(), new_values)
	
func get_grid_size() -> Vector2i:
	return Vector2i(get_meta_columns(), get_meta_rows())

func get_grid_count() -> int:
	return get_grid_size().x * get_grid_size().y
	
func get_meta_columns_name() -> String:
	return "%s_columns" % get_edited_property()

func get_meta_rows_name() -> String:
	return  "%s_rows" % get_edited_property()

func get_meta_columns() -> int:
	if (!get_edited_object().has_meta(get_meta_columns_name())):
		set_meta_columns(1)
	
	return get_edited_object().get_meta(get_meta_columns_name())

func set_meta_columns(value : int) -> void:
	get_edited_object().set_meta(get_meta_columns_name(), value)

func get_meta_rows() -> int:
	if (!get_edited_object().has_meta(get_meta_rows_name())):
		set_meta_rows(1)
		
	return get_edited_object().get_meta(get_meta_rows_name())

func set_meta_rows(value : int) -> void:
	get_edited_object().set_meta(get_meta_rows_name(), value)

func _ready() -> void:
	initColumns()
	initRows()

	prev_size = get_grid_size()

	grid_array_container = GridContainer.new()

	create_controls()

func _update_property() -> void:
	if (get_grid_count() != get_values().size()):
		if (get_values().size() == 0):
			set_meta_columns(1)
			set_meta_rows(1)

			columns.set_value_no_signal(get_meta_columns())
			rows.set_value_no_signal(get_meta_rows())

		resize_grid_array()

func create_controls() -> void:
	var inspector_container = VBoxContainer.new()
	var column_container = HBoxContainer.new()
	var row_container = HBoxContainer.new()
	var col_label = Label.new()
	var row_label = Label.new()
	
	grid_array_container.size_flags_horizontal = SIZE_SHRINK_END
	grid_array_container.size_flags_vertical = SIZE_EXPAND_FILL
	inspector_container.size_flags_vertical = SIZE_EXPAND_FILL
	column_container.size_flags_horizontal = SIZE_SHRINK_END
	row_container.size_flags_horizontal = SIZE_SHRINK_END
	
	column_container.alignment = BoxContainer.ALIGNMENT_END
	row_container.alignment = BoxContainer.ALIGNMENT_END
	
	col_label.text = "Cols"
	row_label.text = "Rows"
	
	column_container.add_child(col_label)
	column_container.add_child(columns)
	
	row_container.add_child(row_label)
	row_container.add_child(rows)
	
	inspector_container.add_child(column_container)
	inspector_container.add_child(row_container)
	inspector_container.add_child(grid_array_container)
	
	add_child(inspector_container)
	
	resize_grid_array()

func initColumns() -> void:
	columns = SpinBox.new()
	columns.min_value = 1
	columns.allow_greater = true
	columns.value = get_meta_columns()
	columns.alignment = HORIZONTAL_ALIGNMENT_RIGHT

	columns.value_changed.connect(func(value):
		if (get_values() != null):
			set_meta_columns(value)
			
			emit_changed(get_edited_property(), get_values())
	)

func initRows() -> void:
	rows = SpinBox.new()
	rows.min_value = 1
	rows.allow_greater = true
	rows.value = get_meta_rows()
	rows.alignment = HORIZONTAL_ALIGNMENT_RIGHT

	rows.value_changed.connect(func(value):
		if (get_values() != null):
			set_meta_rows(value)
			
			emit_changed(get_edited_property(), get_values())
	)
	
func resize_grid_array() -> void:
	var new_values = []
	new_values.resize(get_grid_count())
	new_values.fill(false)
	
	for row in get_grid_size().y:
		if (row < prev_size.y):
			for col in get_grid_size().x:
				if (col < prev_size.x):
					var i = row * get_grid_size().x + col
					var old_i = row * prev_size.x + col

					if (old_i < get_values().size()):
						new_values[i] = get_values()[old_i]
				else:
					break
		else:
			break

	set_values(new_values)

	prev_size = get_grid_size()

	update_checkboxes()

func update_checkboxes() -> void:
	var _children = grid_array_container.get_children()

	for _child in _children:
		_child.queue_free()

	grid_array_container.columns = get_meta_columns()

	for row in get_meta_rows():
		for col in get_meta_columns():
			var i = row * get_meta_columns() + col

			if (i < get_values().size()):
				var box = CheckBox.new()

				grid_array_container.add_child(box)
				
				box.button_pressed = get_values()[i]

				box.pressed.connect(func():
					get_values()[i] = box.button_pressed

					emit_changed(get_edited_property(), get_values()))
