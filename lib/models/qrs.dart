import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:park_qr/models/serializers.dart';

part 'qrs.g.dart';

abstract class Qrs implements Built<Qrs, QrsBuilder> {
  Qrs._();
  factory Qrs([void Function(QrsBuilder) updates]) = _$Qrs;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Qrs.serializer, this)
        as Map<String, dynamic>;
  }

  static Qrs fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Qrs.serializer, json)!;
  }

  static Serializer<Qrs> get serializer => _$qrsSerializer;
  String? get uid;
  String? get qrdata;
  String? get bike;
  String? get bikeno;
}
