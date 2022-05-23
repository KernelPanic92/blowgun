# blowgun

A Dart port for gunjs

## Features

TODO

## Getting started

TODO

## Usage

TODO

```dart
import 'package:blowgun/blowgun.dart';

final graph = openGraph();
final node = graph.get('test');

node.put({'name': 'Alice'});

node.stream.listen((value) => print('value: $value'));
```

## Additional information

TODO
