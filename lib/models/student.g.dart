// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Student> _$studentSerializer = new _$StudentSerializer();

class _$StudentSerializer implements StructuredSerializer<Student> {
  @override
  final Iterable<Type> types = const [Student, _$Student];
  @override
  final String wireName = 'Student';

  @override
  Iterable<Object?> serialize(Serializers serializers, Student object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rollno;
    if (value != null) {
      result
        ..add('rollno')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phno;
    if (value != null) {
      result
        ..add('phno')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bikemodel;
    if (value != null) {
      result
        ..add('bikemodel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vehicleno;
    if (value != null) {
      result
        ..add('vehicleno')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.year;
    if (value != null) {
      result
        ..add('year')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dept;
    if (value != null) {
      result
        ..add('dept')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.section;
    if (value != null) {
      result
        ..add('section')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Student deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StudentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rollno':
          result.rollno = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phno':
          result.phno = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bikemodel':
          result.bikemodel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vehicleno':
          result.vehicleno = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dept':
          result.dept = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'section':
          result.section = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Student extends Student {
  @override
  final String? name;
  @override
  final String? rollno;
  @override
  final String? phno;
  @override
  final String? bikemodel;
  @override
  final String? vehicleno;
  @override
  final String? year;
  @override
  final String? dept;
  @override
  final String? section;
  @override
  final String? uid;

  factory _$Student([void Function(StudentBuilder)? updates]) =>
      (new StudentBuilder()..update(updates))._build();

  _$Student._(
      {this.name,
      this.rollno,
      this.phno,
      this.bikemodel,
      this.vehicleno,
      this.year,
      this.dept,
      this.section,
      this.uid})
      : super._();

  @override
  Student rebuild(void Function(StudentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudentBuilder toBuilder() => new StudentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Student &&
        name == other.name &&
        rollno == other.rollno &&
        phno == other.phno &&
        bikemodel == other.bikemodel &&
        vehicleno == other.vehicleno &&
        year == other.year &&
        dept == other.dept &&
        section == other.section &&
        uid == other.uid;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, rollno.hashCode);
    _$hash = $jc(_$hash, phno.hashCode);
    _$hash = $jc(_$hash, bikemodel.hashCode);
    _$hash = $jc(_$hash, vehicleno.hashCode);
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, dept.hashCode);
    _$hash = $jc(_$hash, section.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Student')
          ..add('name', name)
          ..add('rollno', rollno)
          ..add('phno', phno)
          ..add('bikemodel', bikemodel)
          ..add('vehicleno', vehicleno)
          ..add('year', year)
          ..add('dept', dept)
          ..add('section', section)
          ..add('uid', uid))
        .toString();
  }
}

class StudentBuilder implements Builder<Student, StudentBuilder> {
  _$Student? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _rollno;
  String? get rollno => _$this._rollno;
  set rollno(String? rollno) => _$this._rollno = rollno;

  String? _phno;
  String? get phno => _$this._phno;
  set phno(String? phno) => _$this._phno = phno;

  String? _bikemodel;
  String? get bikemodel => _$this._bikemodel;
  set bikemodel(String? bikemodel) => _$this._bikemodel = bikemodel;

  String? _vehicleno;
  String? get vehicleno => _$this._vehicleno;
  set vehicleno(String? vehicleno) => _$this._vehicleno = vehicleno;

  String? _year;
  String? get year => _$this._year;
  set year(String? year) => _$this._year = year;

  String? _dept;
  String? get dept => _$this._dept;
  set dept(String? dept) => _$this._dept = dept;

  String? _section;
  String? get section => _$this._section;
  set section(String? section) => _$this._section = section;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  StudentBuilder();

  StudentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _rollno = $v.rollno;
      _phno = $v.phno;
      _bikemodel = $v.bikemodel;
      _vehicleno = $v.vehicleno;
      _year = $v.year;
      _dept = $v.dept;
      _section = $v.section;
      _uid = $v.uid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Student other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Student;
  }

  @override
  void update(void Function(StudentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Student build() => _build();

  _$Student _build() {
    final _$result = _$v ??
        new _$Student._(
            name: name,
            rollno: rollno,
            phno: phno,
            bikemodel: bikemodel,
            vehicleno: vehicleno,
            year: year,
            dept: dept,
            section: section,
            uid: uid);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
