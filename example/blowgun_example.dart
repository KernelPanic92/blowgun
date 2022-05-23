import 'package:blowgun/blowgun.dart';

void main() {
  final graph = openGraph();
  final node = graph.get('test');

  node.put({'name': 'Alice'});

  node.stream.listen((value) => print('value: $value'));
}
