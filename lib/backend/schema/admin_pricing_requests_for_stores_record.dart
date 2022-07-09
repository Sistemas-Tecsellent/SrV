import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'admin_pricing_requests_for_stores_record.g.dart';

abstract class AdminPricingRequestsForStoresRecord
    implements
        Built<AdminPricingRequestsForStoresRecord,
            AdminPricingRequestsForStoresRecordBuilder> {
  static Serializer<AdminPricingRequestsForStoresRecord> get serializer =>
      _$adminPricingRequestsForStoresRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get pricingRequestId;

  @nullable
  String get shipmentPrice;

  @nullable
  String get deliveryDate;

  @nullable
  String get deliveryTime;

  @nullable
  String get seller;

  @nullable
  String get store;

  @nullable
  String get ownerName;

  @nullable
  String get ownerPhone;

  @nullable
  String get ownerAddress;

  @nullable
  double get subtotal;

  @nullable
  double get total;

  @nullable
  double get earning;

  @nullable
  String get status;

  @nullable
  String get statusForAdmin;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(
          AdminPricingRequestsForStoresRecordBuilder builder) =>
      builder
        ..id = ''
        ..pricingRequestId = ''
        ..shipmentPrice = ''
        ..deliveryDate = ''
        ..deliveryTime = ''
        ..seller = ''
        ..store = ''
        ..ownerName = ''
        ..ownerPhone = ''
        ..ownerAddress = ''
        ..subtotal = 0.0
        ..total = 0.0
        ..earning = 0.0
        ..status = ''
        ..statusForAdmin = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('adminPricingRequestsForStores');

  static Stream<AdminPricingRequestsForStoresRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AdminPricingRequestsForStoresRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  AdminPricingRequestsForStoresRecord._();
  factory AdminPricingRequestsForStoresRecord(
          [void Function(AdminPricingRequestsForStoresRecordBuilder) updates]) =
      _$AdminPricingRequestsForStoresRecord;

  static AdminPricingRequestsForStoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAdminPricingRequestsForStoresRecordData({
  String id,
  String pricingRequestId,
  String shipmentPrice,
  String deliveryDate,
  String deliveryTime,
  String seller,
  String store,
  String ownerName,
  String ownerPhone,
  String ownerAddress,
  double subtotal,
  double total,
  double earning,
  String status,
  String statusForAdmin,
}) =>
    serializers.toFirestore(
        AdminPricingRequestsForStoresRecord.serializer,
        AdminPricingRequestsForStoresRecord((a) => a
          ..id = id
          ..pricingRequestId = pricingRequestId
          ..shipmentPrice = shipmentPrice
          ..deliveryDate = deliveryDate
          ..deliveryTime = deliveryTime
          ..seller = seller
          ..store = store
          ..ownerName = ownerName
          ..ownerPhone = ownerPhone
          ..ownerAddress = ownerAddress
          ..subtotal = subtotal
          ..total = total
          ..earning = earning
          ..status = status
          ..statusForAdmin = statusForAdmin));
