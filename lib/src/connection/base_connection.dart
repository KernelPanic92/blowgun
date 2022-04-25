import '../types/message.dart';

abstract class Connection {
  void send(Message message);

  Stream<Message> get messages;

  dispose();
}
