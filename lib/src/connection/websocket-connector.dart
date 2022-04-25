import 'dart:convert';

import 'package:blowgun/src/connection/base_connection.dart';
import 'package:blowgun/src/types/message.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketConnection extends Connection {
  late IOWebSocketChannel channel;

  WebSocketConnection(String url) {
    channel = IOWebSocketChannel.connect(url);
  }

  @override
  dispose() {
    channel.innerWebSocket?.close(1000, '');
  }

  @override
  Stream<Message> get messages =>
      channel.stream.map(_decodeMessage).expand((element) => element);

  @override
  send(Message message) {
    final json = message.toJson();
    final jsonEncoded = jsonEncode(json);
    channel.sink.add(jsonEncoded);
  }

  List<Message> _decodeMessage(dynamic json) {
    var jsonMessage = jsonDecode(json);
    if (jsonMessage is! List<dynamic>) {
      jsonMessage = <dynamic>[jsonMessage];
    }
    return jsonMessage.map((e) => Message.fromJson(e)).toList();
  }
}
