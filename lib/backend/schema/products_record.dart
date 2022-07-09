import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get title;

  @nullable
  String get description;

  @nullable
  String get mainImage;

  @nullable
  String get sku;

  @nullable
  String get brand;

  @nullable
  String get category;

  @nullable
  String get categoryId;

  @nullable
  BuiltList<String> get images;

  @nullable
  int get views;

  @nullable
  int get likes;

  @nullable
  int get sales;

  @nullable
  String get brandLogo;

  @nullable
  String get owner;

  @nullable
  BuiltList<String> get sellers;

  @nullable
  BuiltList<String> get stores;

  @nullable
  DateTime get lastSale;

  @nullable
  BuiltList<String> get soldBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..id = ''
    ..title = ''
    ..description = ''
    ..mainImage = ''
    ..sku = ''
    ..brand = ''
    ..category = ''
    ..categoryId = ''
    ..images = ListBuilder()
    ..views = 0
    ..likes = 0
    ..sales = 0
    ..brandLogo = ''
    ..owner = ''
    ..sellers = ListBuilder()
    ..stores = ListBuilder()
    ..soldBy = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static ProductsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProductsRecord(
        (c) => c
          ..id = snapshot.data['id']
          ..title = snapshot.data['title']
          ..description = snapshot.data['description']
          ..mainImage = snapshot.data['mainImage']
          ..sku = snapshot.data['sku']
          ..brand = snapshot.data['brand']
          ..category = snapshot.data['category']
          ..categoryId = snapshot.data['categoryId']
          ..images = safeGet(() => ListBuilder(snapshot.data['images']))
          ..views = snapshot.data['views']?.round()
          ..likes = snapshot.data['likes']?.round()
          ..sales = snapshot.data['sales']?.round()
          ..brandLogo = snapshot.data['brandLogo']
          ..owner = snapshot.data['owner']
          ..sellers = safeGet(() => ListBuilder(snapshot.data['sellers']))
          ..stores = safeGet(() => ListBuilder(snapshot.data['stores']))
          ..lastSale = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['lastSale']))
          ..soldBy = safeGet(() => ListBuilder(snapshot.data['soldBy']))
          ..reference = ProductsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProductsRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'products',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;

  static ProductsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProductsRecordData({
  String id,
  String title,
  String description,
  String mainImage,
  String sku,
  String brand,
  String category,
  String categoryId,
  int views,
  int likes,
  int sales,
  String brandLogo,
  String owner,
  DateTime lastSale,
}) =>
    serializers.toFirestore(
        ProductsRecord.serializer,
        ProductsRecord((p) => p
          ..id = id
          ..title = title
          ..description = description
          ..mainImage = mainImage
          ..sku = sku
          ..brand = brand
          ..category = category
          ..categoryId = categoryId
          ..images = null
          ..views = views
          ..likes = likes
          ..sales = sales
          ..brandLogo = brandLogo
          ..owner = owner
          ..sellers = null
          ..stores = null
          ..lastSale = lastSale
          ..soldBy = null));
