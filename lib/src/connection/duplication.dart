import 'package:blowgun/src/connection/base_connection.dart';

import '../types/message.dart';

class DuplicationProxy extends Connection {
  final Connection connector;
  final Set<String> ids = {};

  DuplicationProxy({required this.connector});

  @override
  void send(Message message) {
    final id = message.id;
    if (ids.contains(id)) {
      return;
    }

    ids.add(id);
    connector.send(message);
  }

  @override
  Stream<Message> get messages {
    return connector.messages.where((event) => !ids.contains(event.id));
  }

  @override
  dispose() {
    connector.dispose();
  }
}
