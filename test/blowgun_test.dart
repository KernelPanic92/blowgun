import 'package:blowgun/blowgun.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final blowgun = Blowgun();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(blowgun, isNotNull);
    });
  });
}
