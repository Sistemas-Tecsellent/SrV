import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'work_days_record.g.dart';

abstract class WorkDaysRecord
    implements Built<WorkDaysRecord, WorkDaysRecordBuilder> {
  static Serializer<WorkDaysRecord> get serializer =>
      _$workDaysRecordSerializer;

  @nullable
  bool get enabled;

  @nullable
  String get id;

  @nullable
  DateTime get test;

  @nullable
  DateTime get opens;

  @nullable
  DateTime get closes;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(WorkDaysRecordBuilder builder) => builder
    ..enabled = false
    ..id = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('workDays')
          : FirebaseFirestore.instance.collectionGroup('workDays');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('workDays').doc();

  static Stream<WorkDaysRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<WorkDaysRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  WorkDaysRecord._();
  factory WorkDaysRecord([void Function(WorkDaysRecordBuilder) updates]) =
      _$WorkDaysRecord;

  static WorkDaysRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createWorkDaysRecordData({
  bool enabled,
  String id,
  DateTime test,
  DateTime opens,
  DateTime closes,
}) =>
    serializers.toFirestore(
        WorkDaysRecord.serializer,
        WorkDaysRecord((w) => w
          ..enabled = enabled
          ..id = id
          ..test = test
          ..opens = opens
          ..closes = closes));
