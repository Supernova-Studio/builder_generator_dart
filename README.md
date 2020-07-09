
Generate default operations for models.
This package is heavily inspired by [built_value](https://pub.dev/packages/built_value) package. 

## Usage

Add the corresponding `part` command to the top of the file and mark a class with `@DataClass()` annotation.

    part 'example.g.dart';
    
    @DataClass()  
    class Node {  
      final String label;  
      final Node left;  
      final Node right;  
      
      Node({this.label, this.left, this.right});  
    }

Data class requirements:

 - Non-abstract;
 - All fields must be public and final;
 - Data class should have a default constructor (without a name) with named parameters only;

Note: fields and corresponding constructor parameters should have the same name to be properly matched.

## Generated results

Every data class will have a generated extension with the following operations:

 - `_equals`
 - `_hashCode`
 - `_string`
 - `rebuild`
 - `toBuilder`

Unfortunately, extension members cannot override any existing members, so each data class should have the following code to implement the default behavior:

    @override  
    bool operator ==(dynamic other) => this._equals(other);  
      
    @override  
    String toString() => this._string;  
      
    @override  
    int get hashCode => this._hashCode;

Moreover, each data class will have a corresponding builder.
Builder is used by `rebuild` and `toBuilder` for copying the state of a data class instance.

## Immutability

One of the main idea of this package is model immutability. 
All properties must be final.

This principle should be applied to collections as well.
Immutable collections from [built_collection](https://pub.dev/packages/built_collection) package should be used instead of the usual `List`, `Set` and others.


## Serialization

Data classes can be serialized and deserialized using [json_serializable](https://pub.dev/packages/json_serializable) package.
If your data classes have built collections, then you need to use [json_serializable_immutable_collections](https://pub.dev/packages/json_serializable_immutable_collections) as well.

## Utilities

IDE File template (Supernova guidelines) for creating a new file with a single data class:

    import 'package:data_class/data_class.dart';
    import 'package:json_annotation/json_annotation.dart';
    
    #set( $fileName = $NAME.replace(".dart", "") )
    part '${fileName}.g.dart';
    
    #set ( $d = "$")
    #set( $CamelCaseName = "" )
    #set( $part = "" )
    #foreach($part in $fileName.split("_"))
        #set( $CamelCaseName = "${CamelCaseName}$part.substring(0,1).toUpperCase()$part.substring(1).toLowerCase()" )
    #end
    #set( $className = "SM$CamelCaseName" )
    #parse("File Header.java")
    @JsonSerializable()
    @DataClass()
    class $className {
      //
      /// Properties
      // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    
      
      //
      /// Constructor
      // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    
      $className();
    
      //
      /// Data class members 
      // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
        
      @override
      bool operator ==(dynamic other) => this._equals(other);
    
      @override
      String toString() => this._string;
    
      @override
      int get hashCode => this._hashCode;
    
      //
      /// Mapping
      // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
      
      Map<String, dynamic> toJson() => _${d}${className}ToJson(this);
    
      factory ${className}.fromJson(Map<String, dynamic> json) =>
          _${d}${className}FromJson(json);
    }

IDE Live template (Supernova guidelines) for creating a data class in an existing file:
```
@JsonSerializable()
@DataClass()
class $CLASS_NAME$ {
  //
  /// Properties
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  
  //
  /// Constructor
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  $CLASS_NAME$();

  //
  /// Data class members 
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    
  @override
  bool operator ==(dynamic other) => this._equals(other);

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
