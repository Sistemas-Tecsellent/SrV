import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'earning_history_record.g.dart';

abstract class EarningHistoryRecord
    implements Built<EarningHistoryRecord, EarningHistoryRecordBuilder> {
  static Serializer<EarningHistoryRecord> get serializer =>
      _$earningHistoryRecordSerializer;

  @nullable
  String get month;

  @nullable
  int get year;

  @nullable
  String get day;

  @nullable
  int get dayInNumber;

  @nullable
  double get earning;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(EarningHistoryRecordBuilder builder) => builder
    ..month = ''
    ..year = 0
    ..day = ''
    ..dayInNumber = 0
    ..earning = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('earningHistory')
          : FirebaseFirestore.instance.collectionGroup('earningHistory');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('earningHistory').doc();

  static Stream<EarningHistoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EarningHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EarningHistoryRecord._();
  factory EarningHistoryRecord(
          [void Function(EarningHistoryRecordBuilder) updates]) =
      _$EarningHistoryRecord;

  static EarningHistoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEarningHistoryRecordData({
  String month,
  int year,
  String day,
  int dayInNumber,
  double earning,
}) =>
    serializers.toFirestore(
        EarningHistoryRecord.serializer,
        EarningHistoryRecord((e) => e
          ..month = month
          ..year = year
          ..day = day
          ..dayInNumber = dayInNumber
          ..earning = earning));
