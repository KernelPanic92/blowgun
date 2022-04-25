import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'soul.g.dart';

@JsonSerializable()
class Soul extends Equatable {
  @JsonKey(name: '#')
  final String soul;

  Soul(this.soul) {
    if (soul.trim().isEmpty) {
      throw Exception('soul cannot be empty');
    }
  }

  @override
  List<Object> get props => [soul];

  factory Soul.fromJson(Map<String, dynamic> json) => _$SoulFromJson(json);

  Map<String, dynamic> toJson() => _$SoulToJson(this);

  @override
  String toString() {
    return 'Soul(\'$soul\')';
  }
}
