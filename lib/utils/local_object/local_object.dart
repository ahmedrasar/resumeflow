import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [StoargeType] must be a valid [SharedPreferences] Type
/// (ie. [bool], [int], [double], [String], [List<String>])
abstract class LocalObject<DomainType, StoargeType> {
  final SharedPreferences _sharedPreferences;

  final String _objectKey;
  late DomainType _object;
  final DomainType _fallbackObject;
  final void Function(DomainType value)? _onChangeCallback;

  /// [objectKey] must be unique
  LocalObject({
    required String objectKey,
    required DomainType fallbackObject,
    required SharedPreferences sharedPreferences,
    required void Function(DomainType value)? onChangeCallback,
    bool callOnFirstLoad = false,
  }) : _objectKey = objectKey,
       _fallbackObject = fallbackObject,
       _sharedPreferences = sharedPreferences,
       _onChangeCallback = onChangeCallback {
    assert(isStoargeType(StoargeType));
    if (!_loadObject()) _object = _fallbackObject;
    if (callOnFirstLoad && _onChangeCallback != null) {
      _onChangeCallback(_object);
    }
  }

  @visibleForTesting
  static bool isStoargeType(Type type) {
    return switch (type) {
      const (bool) ||
      const (int) ||
      const (double) ||
      const (String) ||
      const (List<String>) => true,
      _ => false,
    };
  }

  StoargeType encode(DomainType object);
  DomainType decode(StoargeType encodedObject);

  bool _loadObject() {
    final Object? encodedObject = switch (StoargeType) {
      const (bool) => _sharedPreferences.getBool(_objectKey),
      const (int) => _sharedPreferences.getInt(_objectKey),
      const (double) => _sharedPreferences.getDouble(_objectKey),
      const (String) => _sharedPreferences.getString(_objectKey),
      _ => _sharedPreferences.getStringList(_objectKey),
    };

    if (encodedObject == null) {
      return false;
    } else {
      _object = decode(encodedObject as StoargeType);
      return true;
    }
  }

  DomainType get object => _object;

  Future<void> setObject(DomainType newObject, {bool notify = true}) async {
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
          _objectKey,
          encodedObj as List<String>,
        );
    }

    _object = newObject;
    if (notify && _onChangeCallback != null) _onChangeCallback(object);
  }

  Future<void> reset({bool notify = true}) async {
    await setObject(_fallbackObject, notify: notify);
  }
}

class SymmetricLocalObject<StoargeType>
    extends LocalObject<StoargeType, StoargeType> {
  SymmetricLocalObject({
    required super.objectKey,
    required super.fallbackObject,
    required super.sharedPreferences,
    required super.onChangeCallback,
    super.callOnFirstLoad,
  });

  @override
  StoargeType encode(StoargeType object) => object;

  @override
  StoargeType decode(StoargeType encodedObject) => encodedObject;
}

class EnumLocalObject<EnumType extends Enum>
    extends LocalObject<EnumType, int> {
  final List<EnumType> _values;

  EnumLocalObject({
    required super.objectKey,
    required super.fallbackObject,
    required super.sharedPreferences,
    required super.onChangeCallback,
    required List<EnumType> values,
    super.callOnFirstLoad,
  }) : _values = values;

  @override
  int encode(EnumType object) => object.index;

  @override
  EnumType decode(int encodedObject) => _values[encodedObject];
}
