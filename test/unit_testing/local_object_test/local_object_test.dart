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
    'StoargeType tests',
    () {
      test(
        'int',
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
        'List<String>',
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
      final mockSharedPreferences = MockSharedPreferences();

      test(
        'EnumLocalObject',
        () {
          // Arrange
          const testKey = '-test-enum-';
          const testValue = MockEnum.t0;
          const fallbackValue = MockEnum.t1;
          when(mockSharedPreferences.setInt(testKey, testValue.index))
              .thenAnswer((_) async => true);
          when(mockSharedPreferences.getInt(testKey))
              .thenReturn(testValue.index);

          // Act
          final localEnum = EnumLocalObject<MockEnum>(
            object: fallbackValue,
            objectKey: testKey,
            sharedPreferences: mockSharedPreferences,
            onChangeCallback: null,
            values: MockEnum.values,
          );

          // Assert
          expect(localEnum.object, equals(testValue));
        },
      );
    },
  );
}
