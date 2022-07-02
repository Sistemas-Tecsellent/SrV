import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'brands_record.g.dart';

abstract class BrandsRecord
    implements Built<BrandsRecord, BrandsRecordBuilder> {
  static Serializer<BrandsRecord> get serializer => _$brandsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get logo;

  @nullable
  bool get isTop;

  @nullable
  BuiltList<String> get categories;

  @nullable
  bool get active;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BrandsRecordBuilder builder) => builder
    ..id = ''
    ..logo = ''
    ..isTop = false
    ..categories = ListBuilder()
    ..active = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('brands');

  static Stream<BrandsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BrandsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static BrandsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      BrandsRecord(
        (c) => c
          ..id = snapshot.data['id']
          ..logo = snapshot.data['logo']
          ..isTop = snapshot.data['isTop']
          ..categories = safeGet(() => ListBuilder(snapshot.data['categories']))
          ..active = snapshot.data['active']
          ..reference = BrandsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<BrandsRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'brands',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  BrandsRecord._();
  factory BrandsRecord([void Function(BrandsRecordBuilder) updates]) =
      _$BrandsRecord;

  static BrandsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBrandsRecordData({
  String id,
  String logo,
  bool isTop,
  bool active,
}) =>
    serializers.toFirestore(
        BrandsRecord.serializer,
        BrandsRecord((b) => b
          ..id = id
          ..logo = logo
          ..isTop = isTop
          ..categories = null
          ..active = active));
