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
          assert(LocalObject.isStoargeType(int));
        },
      );
      test(
        'List<String>',
        () {
          assert(LocalObject.isStoargeType(List<String>));
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
          const testKey = '-test-enum-';
          const testValue = MockEnum.t0;
          const fallbackValue = MockEnum.t1;
          when(mockSharedPreferences.setInt(testKey, testValue.index))
              .thenAnswer((_) async => true);
          when(mockSharedPreferences.getInt(testKey))
              .thenReturn(testValue.index);
          final localEmun = EnumLocalObject<MockEnum>(
            object: fallbackValue,
            objectKey: testKey,
            sharedPreferences: mockSharedPreferences,
            onChangeCallback: null,
            values: MockEnum.values,
          );
          assert(localEmun.object == testValue);
        },
      );
    },
  );
}
