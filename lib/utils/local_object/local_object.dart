import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [StoargeType] must be a valid [SharedPreferences] Type
/// (ie. [bool], [int], [double], [String], [List<String>])
abstract class LocalObject<DomainType, StoargeType> {
  final SharedPreferences _sharedPreferences;

  final String _objectKey;
  late DomainType _object;
  void Function()? onChangeCallback;

  /// [objectKey] must be unique
  LocalObject(
      {required String objectKey,
      required DomainType fallbackObject,
      required SharedPreferences sharedPreferences,
      required this.onChangeCallback})
      : _objectKey = objectKey,
        _sharedPreferences = sharedPreferences {
    assert(isStoargeType(StoargeType));
    _loadObject(fallbackObject);
  }

  @visibleForTesting
  static bool isStoargeType(Type type) {
    return switch (type) {
      const (bool) ||
      const (int) ||
      const (double) ||
      const (String) ||
      const (List<String>) =>
        true,
      _ => false
    };
  }

  StoargeType encode(DomainType object);
  DomainType decode(StoargeType encodedObject);

  void _loadObject(DomainType fallbackObject) {
    final Object? encodedObject = switch (StoargeType) {
      const (bool) => _sharedPreferences.getBool(_objectKey),
      const (int) => _sharedPreferences.getInt(_objectKey),
      const (double) => _sharedPreferences.getDouble(_objectKey),
      const (String) => _sharedPreferences.getString(_objectKey),
      _ => _sharedPreferences.getStringList(_objectKey)
    };

    if (encodedObject == null) {
      _object = fallbackObject;
    } else {
      _object = decode(encodedObject as StoargeType);
    }
  }

  DomainType get object => _object;

  Future<void> setObject(DomainType newObject) async {
    if (newObject == object) return;
    final encodedObj = encode(newObject);

    switch (StoargeType) {
      case const (bool):
        await _sharedPreferences.setBool(_objectKey, encodedObj as bool);
      case const (int):
        await _sharedPreferences.setInt(_objectKey, encodedObj as int);
      case const (double):
        await _sharedPreferences.setDouble(_objectKey, encodedObj as double);
      case const (String):
        await _sharedPreferences.setString(_objectKey, encodedObj as String);
      default:
        await _sharedPreferences.setStringList(
            _objectKey, encodedObj as List<String>);
    }

    _object = newObject;
    if (onChangeCallback != null) onChangeCallback!();
  }
}

/// [StoargeType] must be a valid [SharedPreferences] Type
/// (ie. [bool], [int], [double], [String], [List<String>])
class SymmetricLocalObject<StoargeType>
    extends LocalObject<StoargeType, StoargeType> {
  /// [objectKey] must be unique
  SymmetricLocalObject(
      {required super.objectKey,
      required super.fallbackObject,
      required super.sharedPreferences,
      required super.onChangeCallback});

  @override
  StoargeType encode(StoargeType object) => object;

  @override
  StoargeType decode(StoargeType encodedObject) => encodedObject;
}

class EnumLocalObject<EnumType extends Enum>
    extends LocalObject<EnumType, int> {
  final List<EnumType> _values;

  /// [objectKey] must be unique
  EnumLocalObject(
      {required super.objectKey,
      required super.fallbackObject,
      required super.sharedPreferences,
      required super.onChangeCallback,
      required List<EnumType> values})
      : _values = values;

  @override
  int encode(EnumType object) => object.index;

  @override
  EnumType decode(int encodedObject) => _values[encodedObject];
}
