abstract class Chain {
  Chain put(dynamic value);

  Chain? back();

  Chain get(String key);

  Stream<dynamic> get stream;
}
