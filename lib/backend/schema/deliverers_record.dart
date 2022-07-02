import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'deliverers_record.g.dart';

abstract class DeliverersRecord
    implements Built<DeliverersRecord, DeliverersRecordBuilder> {
  static Serializer<DeliverersRecord> get serializer =>
      _$deliverersRecordSerializer;

  @nullable
  String get uid;

  @nullable
  String get transport;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get status;

  @nullable
  String get associatedWith;

  @nullable
  String get statusDetail;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DeliverersRecordBuilder builder) => builder
    ..uid = ''
    ..transport = ''
    ..photoUrl = ''
    ..displayName = ''
    ..status = ''
    ..associatedWith = ''
    ..statusDetail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deliverers');

  static Stream<DeliverersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DeliverersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DeliverersRecord._();
  factory DeliverersRecord([void Function(DeliverersRecordBuilder) updates]) =
      _$DeliverersRecord;

  static DeliverersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDeliverersRecordData({
  String uid,
  String transport,
  String photoUrl,
  String displayName,
  String status,
  String associatedWith,
  String statusDetail,
}) =>
    serializers.toFirestore(
        DeliverersRecord.serializer,
        DeliverersRecord((d) => d
          ..uid = uid
          ..transport = transport
          ..photoUrl = photoUrl
          ..displayName = displayName
          ..status = status
          ..associatedWith = associatedWith
          ..statusDetail = statusDetail));
