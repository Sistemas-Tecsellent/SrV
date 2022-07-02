import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sellers_record.g.dart';

abstract class SellersRecord
    implements Built<SellersRecord, SellersRecordBuilder> {
  static Serializer<SellersRecord> get serializer => _$sellersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get location;

  @nullable
  String get sellerId;

  @nullable
  String get storeId;

  @nullable
  double get weeklyEarning;

  @nullable
  BuiltList<String> get recentlyAddedProducts;

  @nullable
  String get fiscalType;

  @nullable
  String get fiscalName;

  @nullable
  String get fiscalRFC;

  @nullable
  String get fiscalAddress;

  @nullable
  String get fiscalContactName;

  @nullable
  String get fiscalEmail;

  @nullable
  String get fiscalContactPhone;

  @nullable
  String get fiscalRepresentativeName;

  @nullable
  String get fiscalRepresentativeEmail;

  @nullable
  String get businessType;

  @nullable
  String get proofOfAddress;

  @nullable
  String get bankCover;

  @nullable
  String get fiscalRepresentativeIdentification;

  @nullable
  String get proxyStatement;

  @nullable
  String get constitutiveAct;

  @nullable
  String get accountHolder;

  @nullable
  String get bank;

  @nullable
  String get accountNo;

  @nullable
  String get clabe;

  @nullable
  String get invoicePhone;

  @nullable
  bool get isApproved;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SellersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..location = ''
    ..sellerId = ''
    ..storeId = ''
    ..weeklyEarning = 0.0
    ..recentlyAddedProducts = ListBuilder()
    ..fiscalType = ''
    ..fiscalName = ''
    ..fiscalRFC = ''
    ..fiscalAddress = ''
    ..fiscalContactName = ''
    ..fiscalEmail = ''
    ..fiscalContactPhone = ''
    ..fiscalRepresentativeName = ''
    ..fiscalRepresentativeEmail = ''
    ..businessType = ''
    ..proofOfAddress = ''
    ..bankCover = ''
    ..fiscalRepresentativeIdentification = ''
    ..proxyStatement = ''
    ..constitutiveAct = ''
    ..accountHolder = ''
    ..bank = ''
    ..accountNo = ''
    ..clabe = ''
    ..invoicePhone = ''
    ..isApproved = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sellers');

  static Stream<SellersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SellersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SellersRecord._();
  factory SellersRecord([void Function(SellersRecordBuilder) updates]) =
      _$SellersRecord;

  static SellersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSellersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String location,
  String sellerId,
  String storeId,
  double weeklyEarning,
  String fiscalType,
  String fiscalName,
  String fiscalRFC,
  String fiscalAddress,
  String fiscalContactName,
  String fiscalEmail,
  String fiscalContactPhone,
  String fiscalRepresentativeName,
  String fiscalRepresentativeEmail,
  String businessType,
  String proofOfAddress,
  String bankCover,
  String fiscalRepresentativeIdentification,
  String proxyStatement,
  String constitutiveAct,
  String accountHolder,
  String bank,
  String accountNo,
  String clabe,
  String invoicePhone,
  bool isApproved,
}) =>
    serializers.toFirestore(
        SellersRecord.serializer,
        SellersRecord((s) => s
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..location = location
          ..sellerId = sellerId
          ..storeId = storeId
          ..weeklyEarning = weeklyEarning
          ..recentlyAddedProducts = null
          ..fiscalType = fiscalType
          ..fiscalName = fiscalName
          ..fiscalRFC = fiscalRFC
          ..fiscalAddress = fiscalAddress
          ..fiscalContactName = fiscalContactName
          ..fiscalEmail = fiscalEmail
          ..fiscalContactPhone = fiscalContactPhone
          ..fiscalRepresentativeName = fiscalRepresentativeName
          ..fiscalRepresentativeEmail = fiscalRepresentativeEmail
          ..businessType = businessType
          ..proofOfAddress = proofOfAddress
          ..bankCover = bankCover
          ..fiscalRepresentativeIdentification =
              fiscalRepresentativeIdentification
          ..proxyStatement = proxyStatement
          ..constitutiveAct = constitutiveAct
          ..accountHolder = accountHolder
          ..bank = bank
          ..accountNo = accountNo
          ..clabe = clabe
          ..invoicePhone = invoicePhone
          ..isApproved = isApproved));
