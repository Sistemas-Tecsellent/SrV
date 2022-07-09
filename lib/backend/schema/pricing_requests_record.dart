import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pricing_requests_record.g.dart';

abstract class PricingRequestsRecord
    implements Built<PricingRequestsRecord, PricingRequestsRecordBuilder> {
  static Serializer<PricingRequestsRecord> get serializer =>
      _$pricingRequestsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get checkoutId;

  @nullable
  String get owner;

  @nullable
  String get ownerName;

  @nullable
  String get ownerAddress;

  @nullable
  String get ownerPhone;

  @nullable
  double get productsTotal;

  @nullable
  String get shipmentPrice;

  @nullable
  String get assignedTo;

  @nullable
  String get deliveryDate;

  @nullable
  String get deliveryTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PricingRequestsRecordBuilder builder) =>
      builder
        ..id = ''
        ..checkoutId = ''
        ..owner = ''
        ..ownerName = ''
        ..ownerAddress = ''
        ..ownerPhone = ''
        ..productsTotal = 0.0
        ..shipmentPrice = ''
        ..assignedTo = ''
        ..deliveryDate = ''
        ..deliveryTime = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pricingRequests');

  static Stream<PricingRequestsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PricingRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  PricingRequestsRecord._();
  factory PricingRequestsRecord(
          [void Function(PricingRequestsRecordBuilder) updates]) =
      _$PricingRequestsRecord;

  static PricingRequestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPricingRequestsRecordData({
  String id,
  String checkoutId,
  String owner,
  String ownerName,
  String ownerAddress,
  String ownerPhone,
  double productsTotal,
  String shipmentPrice,
  String assignedTo,
  String deliveryDate,
  String deliveryTime,
}) =>
    serializers.toFirestore(
        PricingRequestsRecord.serializer,
        PricingRequestsRecord((p) => p
          ..id = id
          ..checkoutId = checkoutId
          ..owner = owner
          ..ownerName = ownerName
          ..ownerAddress = ownerAddress
          ..ownerPhone = ownerPhone
          ..productsTotal = productsTotal
          ..shipmentPrice = shipmentPrice
          ..assignedTo = assignedTo
          ..deliveryDate = deliveryDate
          ..deliveryTime = deliveryTime));
