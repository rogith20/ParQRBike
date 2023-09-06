// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrs.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Qrs> _$qrsSerializer = new _$QrsSerializer();

class _$QrsSerializer implements StructuredSerializer<Qrs> {
  @override
  final Iterable<Type> types = const [Qrs, _$Qrs];
  @override
  final String wireName = 'Qrs';

  @override
  Iterable<Object?> serialize(Serializers serializers, Qrs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.qrdata;
    if (value != null) {
      result
        ..add('qrdata')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bike;
    if (value != null) {
      result
        ..add('bike')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bikeno;
    if (value != null) {
      result
        ..add('bikeno')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Qrs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QrsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'qrdata':
          result.qrdata = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bike':
          result.bike = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bikeno':
          result.bikeno = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Qrs extends Qrs {
  @override
  final String? uid;
  @override
  final String? qrdata;
  @override
  final String? bike;
  @override
  final String? bikeno;

  factory _$Qrs([void Function(QrsBuilder)? updates]) =>
      (new QrsBuilder()..update(updates))._build();

  _$Qrs._({this.uid, this.qrdata, this.bike, this.bikeno}) : super._();

  @override
  Qrs rebuild(void Function(QrsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QrsBuilder toBuilder() => new QrsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Qrs &&
        uid == other.uid &&
        qrdata == other.qrdata &&
        bike == other.bike &&
        bikeno == other.bikeno;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, qrdata.hashCode);
    _$hash = $jc(_$hash, bike.hashCode);
    _$hash = $jc(_$hash, bikeno.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Qrs')
          ..add('uid', uid)
          ..add('qrdata', qrdata)
          ..add('bike', bike)
          ..add('bikeno', bikeno))
        .toString();
  }
}

class QrsBuilder implements Builder<Qrs, QrsBuilder> {
  _$Qrs? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _qrdata;
  String? get qrdata => _$this._qrdata;
  set qrdata(String? qrdata) => _$this._qrdata = qrdata;

  String? _bike;
  String? get bike => _$this._bike;
  set bike(String? bike) => _$this._bike = bike;

  String? _bikeno;
  String? get bikeno => _$this._bikeno;
  set bikeno(String? bikeno) => _$this._bikeno = bikeno;

  QrsBuilder();

  QrsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _qrdata = $v.qrdata;
      _bike = $v.bike;
      _bikeno = $v.bikeno;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Qrs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Qrs;
  }

  @override
  void update(void Function(QrsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Qrs build() => _build();

  _$Qrs _build() {
    final _$result = _$v ??
        new _$Qrs._(uid: uid, qrdata: qrdata, bike: bike, bikeno: bikeno);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
