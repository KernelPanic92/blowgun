import 'package:blowgun/src/types/soul.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import '../serialization/serialization.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: '#')
  final String id;
  @JsonKey(name: '@')
  final String? replyTo;
  @JsonKey(readValue: skipEmptyObject)
  final Soul? get;
  @JsonKey(fromJson: coerceBoolean)
  final bool? ack;
  @JsonKey(name: 'err')
  final dynamic error;
  @JsonKey(fromJson: coerceBoolean)
  final bool? ok;

  Message({
    String? id,
    this.replyTo,
    this.get,
    this.ack,
    this.error,
    this.ok,
  }) : id = id ?? Uuid().v1().toString();

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  String toString() {
    return 'Message{id: $id, replyTo: $replyTo, get: $get, ack: $ack, error: $error, ok: $ok}';
  }
}
