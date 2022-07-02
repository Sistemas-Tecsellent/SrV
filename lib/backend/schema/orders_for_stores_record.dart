import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'orders_for_stores_record.g.dart';

abstract class OrdersForStoresRecord
    implements Built<OrdersForStoresRecord, OrdersForStoresRecordBuilder> {
  static Serializer<OrdersForStoresRecord> get serializer =>
      _$ordersForStoresRecordSerializer;

  @nullable
  String get bundleId;

  @nullable
  String get orderId;

  @nullable
  String get id;

  @nullable
  String get customerName;

  @nullable
  String get customerPhone;

  @nullable
  String get customerAddress;

  @nullable
  String get seller;

  @nullable
  String get store;

  @nullable
  double get total;

  @nullable
  String get status;

  @nullable
  String get statusDetail;

  @nullable
  String get type;

  @nullable
  double get subtotal;

  @nullable
  String get deliverer;

  @nullable
  String get parcelName;

  @nullable
  String get parcelGuide;

  @nullable
  String get parcelLink;

  @nullable
  String get guide;

  @nullable
  String get code;

  @nullable
  String get shipmentType;

  @nullable
  bool get isFromSellerWiseOrder;

  @nullable
  String get assignedDeliverer;

  @nullable
  String get deliveredBy;

  @nullable
  DateTime get createdDate;

  @nullable
  String get deliveredDay;

  @nullable
  int get deliveredDayInNumber;

  @nullable
  String get deliveredMonth;

  @nullable
  int get deliveredYear;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrdersForStoresRecordBuilder builder) =>
      builder
        ..bundleId = ''
        ..orderId = ''
        ..id = ''
        ..customerName = ''
        ..customerPhone = ''
        ..customerAddress = ''
        ..seller = ''
        ..store = ''
        ..total = 0.0
        ..status = ''
        ..statusDetail = ''
        ..type = ''
        ..subtotal = 0.0
        ..deliverer = ''
        ..parcelName = ''
        ..parcelGuide = ''
        ..parcelLink = ''
        ..guide = ''
        ..code = ''
        ..shipmentType = ''
        ..isFromSellerWiseOrder = false
        ..assignedDeliverer = ''
        ..deliveredBy = ''
        ..deliveredDay = ''
        ..deliveredDayInNumber = 0
        ..deliveredMonth = ''
        ..deliveredYear = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ordersForStores');

  static Stream<OrdersForStoresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrdersForStoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrdersForStoresRecord._();
  factory OrdersForStoresRecord(
          [void Function(OrdersForStoresRecordBuilder) updates]) =
      _$OrdersForStoresRecord;

  static OrdersForStoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrdersForStoresRecordData({
  String bundleId,
  String orderId,
  String id,
  String customerName,
  String customerPhone,
  String customerAddress,
  String seller,
  String store,
  double total,
  String status,
  String statusDetail,
  String type,
  double subtotal,
  String deliverer,
  String parcelName,
  String parcelGuide,
  String parcelLink,
  String guide,
  String code,
  String shipmentType,
  bool isFromSellerWiseOrder,
  String assignedDeliverer,
  String deliveredBy,
  DateTime createdDate,
  String deliveredDay,
  int deliveredDayInNumber,
  String deliveredMonth,
  int deliveredYear,
}) =>
    serializers.toFirestore(
        OrdersForStoresRecord.serializer,
        OrdersForStoresRecord((o) => o
          ..bundleId = bundleId
          ..orderId = orderId
          ..id = id
          ..customerName = customerName
          ..customerPhone = customerPhone
          ..customerAddress = customerAddress
          ..seller = seller
          ..store = store
          ..total = total
          ..status = status
          ..statusDetail = statusDetail
          ..type = type
          ..subtotal = subtotal
          ..deliverer = deliverer
          ..parcelName = parcelName
          ..parcelGuide = parcelGuide
          ..parcelLink = parcelLink
          ..guide = guide
          ..code = code
          ..shipmentType = shipmentType
          ..isFromSellerWiseOrder = isFromSellerWiseOrder
          ..assignedDeliverer = assignedDeliverer
          ..deliveredBy = deliveredBy
          ..createdDate = createdDate
          ..deliveredDay = deliveredDay
          ..deliveredDayInNumber = deliveredDayInNumber
          ..deliveredMonth = deliveredMonth
          ..deliveredYear = deliveredYear));
