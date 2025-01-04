# Godot Grid Array

![Godot v4.x](https://img.shields.io/badge/Godot-v4.x-%23478cbf?logo=godot-engine&logoColor=white&style=flat-square)

![The Godot logo made with a grid array.](https://github.com/TheQuietCroc/GodotGridArray/blob/main/screenshots/Godot%20logo.png?raw=true)

Display boolean arrays as a grid of checkboxes in the inspector.

## Usage

Include `GridArray` or `grid_array` (not case-sensitive) in your exported Array's name.

If you want to change the number of columns and rows in code, update the node's metadata. The naming convention is `{property name}_{columns/rows}`.

### GDScript

```gdscript
@export
var Grid_arrayExample: Array
# Metadata names
# Grid_arrayExample_columns
# Grid_arrayExample_rows

@export
var gridArraysample: Array
# Metadata names
# gridArraysample_columns
# gridArraysample_rows
```

### C#

```csharp
[Export]
public Array<bool> TestGridArray { get; private set; } = new();
// Metadata names
// TestGridArray_columns
// TestGridArray_rows

[Export]
private Array<bool> _grid_array_ = new();
// Metadata names
// _grid_array__columns
// _grid_array__rows
```

## Screenshots
![An example of the default values of the grid array. Columns, rows, and the number of entries in the array are all set to 1.](https://github.com/TheQuietCroc/GodotGridArray/blob/main/screenshots/Initial%20value.png?raw=true)
![An example of a 5 column and 3 row grid array with no check marks.](https://github.com/TheQuietCroc/GodotGridArray/blob/main/screenshots/Blank%20grid.png?raw=true)
![An example of a 3 column and 5 row grid array with some check marks.](https://github.com/TheQuietCroc/GodotGridArray/blob/main/screenshots/Filled%20grid.png?raw=true)
