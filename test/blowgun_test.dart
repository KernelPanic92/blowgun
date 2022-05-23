import 'package:blowgun/blowgun.dart';
import 'package:test/test.dart';

void main() {
  group('Client API', () {
    late Graph graph;

    setUp(() {
      graph = openGraph();
    });

    test('Should not retrieve the node when it does not exist', () {
      final node = graph.get('test');

      expect(node.stream, emitsInOrder([]));
    });

    test('Should retrieve the node when it exists', () {
      final node = graph.get('test');

      node.put({'name': 'test'});

      expect(node.stream, emitsInOrder([isNotNull]));
    });

    test('Should not retrieve the field of a node when the node does not exist', () {
      final field = graph.get('test').get('field');

      expect(field.stream, emitsInOrder(['test']));
    });

    test('Should not retrieve the field of a node when the field does not exist', () {
      final node = graph.get('test');
      final field = graph.get('test').get('field');

      node.put({'name': 'test'});

      expect(field.stream, emitsInOrder([]));
    });

    test('Should retrieve the field of a node when the field exists', () {
      final node = graph.get('test');
      final field = graph.get('test').get('name');

      node.put(<String, String>{'name': 'Alice'});

      expect(field.stream, emitsInOrder(['Alice']));
    });
  });
}
