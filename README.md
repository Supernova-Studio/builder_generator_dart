Generate default operations for models.

## Utilites

IDE Live template:
```
@JsonSerializable()
class $CLASS_NAME$ implements DataClass<$CLASS_NAME$> {
  //
  /// Properties
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  
  //
  /// Constructor
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  $CLASS_NAME$({});

  //
  /// Data class members 
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    
  @override
  $CLASS_NAME$ rebuild(Function(DataClassBuilder<$CLASS_NAME$>) updates) => _rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;

  //
  /// Mapping
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
  
  Map<String, dynamic> toJson() => _$$$CLASS_NAME$ToJson(this);

  factory $CLASS_NAME$.fromJson(Map<String, dynamic> json) =>
      _$$$CLASS_NAME$FromJson(json);
}
```
