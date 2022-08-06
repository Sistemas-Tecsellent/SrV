// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliverers_location_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeliverersLocationRecord> _$deliverersLocationRecordSerializer =
    new _$DeliverersLocationRecordSerializer();

class _$DeliverersLocationRecordSerializer
    implements StructuredSerializer<DeliverersLocationRecord> {
  @override
  final Iterable<Type> types = const [
    DeliverersLocationRecord,
    _$DeliverersLocationRecord
  ];
  @override
  final String wireName = 'DeliverersLocationRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DeliverersLocationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  DeliverersLocationRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeliverersLocationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$DeliverersLocationRecord extends DeliverersLocationRecord {
  @override
  final String id;
  @override
  final String order;
  @override
  final DocumentReference<Object> reference;

  factory _$DeliverersLocationRecord(
          [void Function(DeliverersLocationRecordBuilder) updates]) =>
      (new DeliverersLocationRecordBuilder()..update(updates))._build();

  _$DeliverersLocationRecord._({this.id, this.order, this.reference})
      : super._();

  @override
  DeliverersLocationRecord rebuild(
          void Function(DeliverersLocationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeliverersLocationRecordBuilder toBuilder() =>
      new DeliverersLocationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeliverersLocationRecord &&
        id == other.id &&
        order == other.order &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), order.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeliverersLocationRecord')
          ..add('id', id)
          ..add('order', order)
          ..add('reference', reference))
        .toString();
  }
}

class DeliverersLocationRecordBuilder
    implements
        Builder<DeliverersLocationRecord, DeliverersLocationRecordBuilder> {
  _$DeliverersLocationRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _order;
  String get order => _$this._order;
  set order(String order) => _$this._order = order;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DeliverersLocationRecordBuilder() {
    DeliverersLocationRecord._initializeBuilder(this);
  }

  DeliverersLocationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _order = $v.order;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeliverersLocationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeliverersLocationRecord;
  }

  @override
  void update(void Function(DeliverersLocationRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  DeliverersLocationRecord build() => _build();

  _$DeliverersLocationRecord _build() {
    final _$result = _$v ??
        new _$DeliverersLocationRecord._(
            id: id, order: order, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
