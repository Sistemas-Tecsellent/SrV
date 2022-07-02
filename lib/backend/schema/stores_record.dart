import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stores_record.g.dart';

abstract class StoresRecord
    implements Built<StoresRecord, StoresRecordBuilder> {
  static Serializer<StoresRecord> get serializer => _$storesRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get owner;

  @nullable
  String get name;

  @nullable
  String get location;

  @nullable
  String get locationCity;

  @nullable
  BuiltList<String> get enabledDays;

  @nullable
  String get logo;

  @nullable
  String get banner;

  @nullable
  LatLng get mapLocation;

  @nullable
  String get address;

  @nullable
  BuiltList<String> get openHours;

  @nullable
  BuiltList<String> get closedHours;

  @nullable
  BuiltList<String> get transports;

  @nullable
  BuiltList<String> get activeProducts;

  @nullable
  bool get isApproved;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StoresRecordBuilder builder) => builder
    ..id = ''
    ..owner = ''
    ..name = ''
    ..location = ''
    ..locationCity = ''
    ..enabledDays = ListBuilder()
    ..logo = ''
    ..banner = ''
    ..address = ''
    ..openHours = ListBuilder()
    ..closedHours = ListBuilder()
    ..transports = ListBuilder()
    ..activeProducts = ListBuilder()
    ..isApproved = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stores');

  static Stream<StoresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StoresRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StoresRecord._();
  factory StoresRecord([void Function(StoresRecordBuilder) updates]) =
      _$StoresRecord;

  static StoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStoresRecordData({
  String id,
  String owner,
  String name,
  String location,
  String locationCity,
  String logo,
  String banner,
  LatLng mapLocation,
  String address,
  bool isApproved,
}) =>
    serializers.toFirestore(
        StoresRecord.serializer,
        StoresRecord((s) => s
          ..id = id
          ..owner = owner
          ..name = name
          ..location = location
          ..locationCity = locationCity
          ..enabledDays = null
          ..logo = logo
          ..banner = banner
          ..mapLocation = mapLocation
          ..address = address
          ..openHours = null
          ..closedHours = null
          ..transports = null
          ..activeProducts = null
          ..isApproved = isApproved));
