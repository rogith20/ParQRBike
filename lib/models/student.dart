import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:park_qr/models/serializers.dart';

part 'student.g.dart';

abstract class Student implements Built<Student, StudentBuilder> {
  Student._();
  factory Student([void Function(StudentBuilder) updates]) = _$Student;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Student.serializer, this)
        as Map<String, dynamic>;
  }

  static Student fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Student.serializer, json)!;
  }

  static Serializer<Student> get serializer => _$studentSerializer;
  String? get name;
  String? get rollno;
  String? get phno;
  String? get bikemodel;
  String? get vehicleno;
  String? get year;
  String? get dept;
  String? get section;
  String? get uid;
}
