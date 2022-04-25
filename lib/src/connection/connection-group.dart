import 'package:blowgun/src/connection/base_connection.dart';
import 'package:rxdart/rxdart.dart';

import '../types/message.dart';

class ConnectionGroup extends Connection {
  final List<Connection> connectors;

  ConnectionGroup({List<Connection>? connectors})
      : connectors = connectors ?? [];

  ConnectionGroup add(Connection connector) {
    connectors.add(connector);
    return this;
  }

  @override
  void send(Message message) {
    for (var connector in connectors) {
      connector.send(message);
    }
  }

  @override
  Stream<Message> get messages {
    return MergeStream(connectors.map((connector) => connector.messages));
  }

  @override
  dispose() {
    for (var connector in connectors) {
      connector.dispose();
    }
  }
}
