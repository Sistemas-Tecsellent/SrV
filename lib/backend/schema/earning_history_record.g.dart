// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earning_history_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EarningHistoryRecord> _$earningHistoryRecordSerializer =
    new _$EarningHistoryRecordSerializer();

class _$EarningHistoryRecordSerializer
    implements StructuredSerializer<EarningHistoryRecord> {
  @override
  final Iterable<Type> types = const [
    EarningHistoryRecord,
    _$EarningHistoryRecord
  ];
  @override
  final String wireName = 'EarningHistoryRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, EarningHistoryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.month;
    if (value != null) {
      result
        ..add('month')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.year;
    if (value != null) {
      result
        ..add('year')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dayInNumber;
    if (value != null) {
      result
        ..add('dayInNumber')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.earning;
    if (value != null) {
      result
        ..add('earning')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  EarningHistoryRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EarningHistoryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'month':
          result.month = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dayInNumber':
          result.dayInNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'earning':
          result.earning = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
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

class _$EarningHistoryRecord extends EarningHistoryRecord {
  @override
  final String month;
  @override
  final int year;
  @override
  final String day;
  @override
  final int dayInNumber;
  @override
  final double earning;
  @override
  final DocumentReference<Object> reference;

  factory _$EarningHistoryRecord(
          [void Function(EarningHistoryRecordBuilder) updates]) =>
      (new EarningHistoryRecordBuilder()..update(updates))._build();

  _$EarningHistoryRecord._(
      {this.month,
      this.year,
      this.day,
      this.dayInNumber,
      this.earning,
      this.reference})
      : super._();

  @override
  EarningHistoryRecord rebuild(
          void Function(EarningHistoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EarningHistoryRecordBuilder toBuilder() =>
      new EarningHistoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EarningHistoryRecord &&
        month == other.month &&
        year == other.year &&
        day == other.day &&
        dayInNumber == other.dayInNumber &&
        earning == other.earning &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, month.hashCode), year.hashCode), day.hashCode),
                dayInNumber.hashCode),
            earning.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EarningHistoryRecord')
          ..add('month', month)
          ..add('year', year)
          ..add('day', day)
          ..add('dayInNumber', dayInNumber)
          ..add('earning', earning)
          ..add('reference', reference))
        .toString();
  }
}

class EarningHistoryRecordBuilder
    implements Builder<EarningHistoryRecord, EarningHistoryRecordBuilder> {
  _$EarningHistoryRecord _$v;

  String _month;
  String get month => _$this._month;
  set month(String month) => _$this._month = month;

  int _year;
  int get year => _$this._year;
  set year(int year) => _$this._year = year;

  String _day;
  String get day => _$this._day;
  set day(String day) => _$this._day = day;

  int _dayInNumber;
  int get dayInNumber => _$this._dayInNumber;
  set dayInNumber(int dayInNumber) => _$this._dayInNumber = dayInNumber;

  double _earning;
  double get earning => _$this._earning;
  set earning(double earning) => _$this._earning = earning;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  EarningHistoryRecordBuilder() {
    EarningHistoryRecord._initializeBuilder(this);
  }

  EarningHistoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _month = $v.month;
      _year = $v.year;
      _day = $v.day;
      _dayInNumber = $v.dayInNumber;
      _earning = $v.earning;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EarningHistoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EarningHistoryRecord;
  }

  @override
  void update(void Function(EarningHistoryRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  EarningHistoryRecord build() => _build();

  _$EarningHistoryRecord _build() {
    final _$result = _$v ??
        new _$EarningHistoryRecord._(
            month: month,
            year: year,
            day: day,
            dayInNumber: dayInNumber,
            earning: earning,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
