part of 'graph.dart';

class _GraphImpl implements Graph {
  @override
  Chain get(String key) {
    return _ChainImpl(key: key);
  }
}

Graph _openGraph() {
  return _GraphImpl();
}
