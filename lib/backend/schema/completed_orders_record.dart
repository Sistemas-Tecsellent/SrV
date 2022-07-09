import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'completed_orders_record.g.dart';

abstract class CompletedOrdersRecord
    implements Built<CompletedOrdersRecord, CompletedOrdersRecordBuilder> {
  static Serializer<CompletedOrdersRecord> get serializer =>
      _$completedOrdersRecordSerializer;

  @nullable
  String get id;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(CompletedOrdersRecordBuilder builder) =>
      builder..id = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('completedOrders')
          : FirebaseFirestore.instance.collectionGroup('completedOrders');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('completedOrders').doc();

  static Stream<CompletedOrdersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CompletedOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CompletedOrdersRecord._();
  factory CompletedOrdersRecord(
          [void Function(CompletedOrdersRecordBuilder) updates]) =
      _$CompletedOrdersRecord;

  static CompletedOrdersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCompletedOrdersRecordData({
  String id,
}) =>
    serializers.toFirestore(CompletedOrdersRecord.serializer,
        CompletedOrdersRecord((c) => c..id = id));
