# Godot Grid Array

![Godot v4.x](https://img.shields.io/badge/Godot-v4.x-%23478cbf?logo=godot-engine&logoColor=white&style=flat-square)

Display boolean arrays as a grid of checkboxes in the inspector.

## Usage

Include `GridArray` or `grid_array` (not case-sensitive) in your exported Array's name.

### GDScript

```gdscript
@export
var Grid_arrayExample: Array
@export
var gridArraysample: Array
```

### C#

```csharp
[Export]
public Array<bool> TestGridArray { get; private set; } = new();

[Export]
private Array<bool> _grid_array_ = new();
```

## Screenshots
![An example of the default values of the grid array. Columns, rows, and the number of entries in the array are all set to 1.](https://github.com/TheQuietCroc/GodotGridArray/blob/main/screenshots/Initial%20value.png?raw=true)
![An example of a 5 column and 3 row grid array with no check marks.](https://github.com/TheQuietCroc/GodotGridArray/blob/main/screenshots/Blank%20grid.png?raw=true)
![An example of a 3 column and 5 row grid array with some check marks.](https://github.com/TheQuietCroc/GodotGridArray/blob/main/screenshots/Filled%20grid.png?raw=true)
