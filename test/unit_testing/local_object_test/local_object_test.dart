import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:resumeflow/utils/local_object/local_object.dart';
import 'package:test/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'local_object_test.mocks.dart';

enum MockEnum {
  t0,
  t1,
  t2;
}

@GenerateMocks([SharedPreferences])
void main() {
  group(
    'LocalObject StoargeType tests',
    () {
      test(
        'bool is a LocalObject StoargeType',
        () {
          // Arrange
          const Type boolType = bool;

          // Act
          final isValidType = LocalObject.isStoargeType(boolType);

          // Assert
          expect(isValidType, isTrue);
        },
      );

      test(
        'int is a LocalObject StoargeType',
        () {
          // Arrange
          const Type intType = int;

          // Act
          final isValidType = LocalObject.isStoargeType(intType);

          // Assert
          expect(isValidType, isTrue);
        },
      );

      test(
        'double is a LocalObject StoargeType',
        () {
          // Arrange
          const Type doubleType = double;

          // Act
          final isValidType = LocalObject.isStoargeType(doubleType);

          // Assert
          expect(isValidType, isTrue);
        },
      );

      test(
        'String is a LocalObject StoargeType',
        () {
          // Arrange
          const Type stringType = String;

          // Act
          final isValidType = LocalObject.isStoargeType(stringType);

          // Assert
          expect(isValidType, isTrue);
        },
      );
      test(
        'List<String> is a LocalObject StoargeType',
        () {
          // Arrange
          const Type listStringType = List<String>;

          // Act
          final isValidType = LocalObject.isStoargeType(listStringType);

          // Assert
          expect(isValidType, isTrue);
        },
      );
    },
  );

  group(
    'LocalObject Tests',
    () {
      const testKey = '-test-key-';
      const localValue = MockEnum.t0;
      const fallbackValue = MockEnum.t1;

      test(
        'LocalObject does not use the fallback value when a local value exists',
        () {
          // Arrange
          final mockSharedPreferences = MockSharedPreferences();
          when(mockSharedPreferences.getInt(testKey))
              .thenReturn(localValue.index);

          // Act
          final localEnum = EnumLocalObject<MockEnum>(
            objectKey: testKey,
            fallbackObject: fallbackValue,
            sharedPreferences: mockSharedPreferences,
            onChangeCallback: null,
            values: MockEnum.values,
          );

          // Assert
          expect(localEnum.object, equals(localValue));
        },
      );
      test(
        'LocalObject is initilzed with the fallback value when a local value does not exist',
        () {
          // Arrange
          final mockSharedPreferences = MockSharedPreferences();
          when(mockSharedPreferences.getInt(testKey)).thenReturn(null);

          // Act
          final localEnum = EnumLocalObject<MockEnum>(
            objectKey: testKey,
            fallbackObject: fallbackValue,
            sharedPreferences: mockSharedPreferences,
            onChangeCallback: null,
            values: MockEnum.values,
          );

          // Assert
          expect(localEnum.object, equals(fallbackValue));
        },
      );
    },
  );
}
