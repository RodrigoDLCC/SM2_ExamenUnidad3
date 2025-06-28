import 'package:flutter_test/flutter_test.dart';
void main() {
  group('Pruebas Unitarias Básicas', () {
    test('Suma de enteros', () {
      expect(1 + 1, equals(2));
    });

    test('Lista contiene elemento', () {
      final numbers = [1, 2, 3];
      expect(numbers.contains(2), isTrue);
    });

    test('Conversión de string', () {
      expect('flutter'.toUpperCase(), equals('FLUTTER'));
    });
  });
}