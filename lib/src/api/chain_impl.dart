part of 'graph.dart';

class _ChainImpl implements Chain {
  final String _key;
  final _ChainImpl? _parent;

  _ChainImpl({
    required String key,
    _ChainImpl? parent,
  })  : _key = key,
        _parent = parent,
        assert(key.isNotEmpty, 'key cannot be empty');

  @override
  Chain? back() {
    return _parent;
  }

  @override
  Chain put(value) {
    return this;
  }

  @override
  Stream get stream => Stream.empty();

  @override
  Chain get(String key) {
    return _ChainImpl(
      key: key,
      parent: this,
    );
  }

  List<String> _path() {
    return [..._parent?._path() ?? [], _key];
  }
}
