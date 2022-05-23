import 'package:blowgun/src/api/chain.dart';

part 'chain_impl.dart';

part 'graph_impl.dart';

abstract class Graph {
  Chain get(String key);
}

Graph openGraph() => _openGraph();
