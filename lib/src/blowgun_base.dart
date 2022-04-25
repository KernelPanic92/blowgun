import 'package:blowgun/src/connection/connection.dart';
import 'package:blowgun/src/types/message.dart';
import 'package:blowgun/src/types/soul.dart';

class Blowgun {
  late Connection connector;

  Blowgun({List<String>? peers}) {
    final connectorGroup = ConnectionGroup();
    if (peers != null) {
      peers.map(WebSocketConnection.new).forEach(connectorGroup.add);
    }

    connector = DuplicationProxy(connector: connectorGroup);
  }

  Stream<Message> get(String soul) {
    final message = Message(get: Soul(soul));
    final id = message.id;
    connector.send(message);
    return connector.messages.where((message) => message.replyTo == id);
  }
}
