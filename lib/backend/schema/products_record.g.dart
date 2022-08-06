// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductsRecord> _$productsRecordSerializer =
    new _$ProductsRecordSerializer();

class _$ProductsRecordSerializer
    implements StructuredSerializer<ProductsRecord> {
  @override
  final Iterable<Type> types = const [ProductsRecord, _$ProductsRecord];
  @override
  final String wireName = 'ProductsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ProductsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mainImage;
    if (value != null) {
      result
        ..add('mainImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sku;
    if (value != null) {
      result
        ..add('sku')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.brand;
    if (value != null) {
      result
        ..add('brand')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryId;
    if (value != null) {
      result
        ..add('categoryId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.views;
    if (value != null) {
      result
        ..add('views')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sales;
    if (value != null) {
      result
        ..add('sales')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.brandLogo;
    if (value != null) {
      result
        ..add('brandLogo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sellers;
    if (value != null) {
      result
        ..add('sellers')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.stores;
    if (value != null) {
      result
        ..add('stores')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.lastSale;
    if (value != null) {
      result
        ..add('lastSale')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.soldBy;
    if (value != null) {
      result
        ..add('soldBy')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  ProductsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mainImage':
          result.mainImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sku':
          result.sku = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryId':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'views':
          result.views = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sales':
          result.sales = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'brandLogo':
          result.brandLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sellers':
          result.sellers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'stores':
          result.stores.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'lastSale':
          result.lastSale = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'soldBy':
          result.soldBy.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductsRecord extends ProductsRecord {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String mainImage;
  @override
  final String sku;
  @override
  final String brand;
  @override
  final String category;
  @override
  final String categoryId;
  @override
  final BuiltList<String> images;
  @override
  final int views;
  @override
  final int likes;
  @override
  final int sales;
  @override
  final String brandLogo;
  @override
  final String owner;
  @override
  final BuiltList<String> sellers;
  @override
  final BuiltList<String> stores;
  @override
  final DateTime lastSale;
  @override
  final BuiltList<String> soldBy;
  @override
  final DocumentReference<Object> reference;

  factory _$ProductsRecord([void Function(ProductsRecordBuilder) updates]) =>
      (new ProductsRecordBuilder()..update(updates))._build();

  _$ProductsRecord._(
      {this.id,
      this.title,
      this.description,
      this.mainImage,
      this.sku,
      this.brand,
      this.category,
      this.categoryId,
      this.images,
      this.views,
      this.likes,
      this.sales,
      this.brandLogo,
      this.owner,
      this.sellers,
      this.stores,
      this.lastSale,
      this.soldBy,
      this.reference})
      : super._();

  @override
  ProductsRecord rebuild(void Function(ProductsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsRecordBuilder toBuilder() =>
      new ProductsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsRecord &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        mainImage == other.mainImage &&
        sku == other.sku &&
        brand == other.brand &&
        category == other.category &&
        categoryId == other.categoryId &&
        images == other.images &&
        views == other.views &&
        likes == other.likes &&
        sales == other.sales &&
        brandLogo == other.brandLogo &&
        owner == other.owner &&
        sellers == other.sellers &&
        stores == other.stores &&
        lastSale == other.lastSale &&
        soldBy == other.soldBy &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                id
                                                                                    .hashCode),
                                                                            title
                                                                                .hashCode),
                                                                        description
                                                                            .hashCode),
                                                                    mainImage
                                                                        .hashCode),
                                                                sku.hashCode),
                                                            brand.hashCode),
                                                        category.hashCode),
                                                    categoryId.hashCode),
                                                images.hashCode),
                                            views.hashCode),
                                        likes.hashCode),
                                    sales.hashCode),
                                brandLogo.hashCode),
                            owner.hashCode),
                        sellers.hashCode),
                    stores.hashCode),
                lastSale.hashCode),
            soldBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductsRecord')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('mainImage', mainImage)
          ..add('sku', sku)
          ..add('brand', brand)
          ..add('category', category)
          ..add('categoryId', categoryId)
          ..add('images', images)
          ..add('views', views)
          ..add('likes', likes)
          ..add('sales', sales)
          ..add('brandLogo', brandLogo)
          ..add('owner', owner)
          ..add('sellers', sellers)
          ..add('stores', stores)
          ..add('lastSale', lastSale)
          ..add('soldBy', soldBy)
          ..add('reference', reference))
        .toString();
  }
}

class ProductsRecordBuilder
    implements Builder<ProductsRecord, ProductsRecordBuilder> {
  _$ProductsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _mainImage;
  String get mainImage => _$this._mainImage;
  set mainImage(String mainImage) => _$this._mainImage = mainImage;

  String _sku;
  String get sku => _$this._sku;
  set sku(String sku) => _$this._sku = sku;

  String _brand;
  String get brand => _$this._brand;
  set brand(String brand) => _$this._brand = brand;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _categoryId;
  String get categoryId => _$this._categoryId;
  set categoryId(String categoryId) => _$this._categoryId = categoryId;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

  int _views;
  int get views => _$this._views;
  set views(int views) => _$this._views = views;

  int _likes;
  int get likes => _$this._likes;
  set likes(int likes) => _$this._likes = likes;

  int _sales;
  int get sales => _$this._sales;
  set sales(int sales) => _$this._sales = sales;

  String _brandLogo;
  String get brandLogo => _$this._brandLogo;
  set brandLogo(String brandLogo) => _$this._brandLogo = brandLogo;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  ListBuilder<String> _sellers;
  ListBuilder<String> get sellers =>
      _$this._sellers ??= new ListBuilder<String>();
  set sellers(ListBuilder<String> sellers) => _$this._sellers = sellers;

  ListBuilder<String> _stores;
  ListBuilder<String> get stores =>
      _$this._stores ??= new ListBuilder<String>();
  set stores(ListBuilder<String> stores) => _$this._stores = stores;

  DateTime _lastSale;
  DateTime get lastSale => _$this._lastSale;
  set lastSale(DateTime lastSale) => _$this._lastSale = lastSale;

  ListBuilder<String> _soldBy;
  ListBuilder<String> get soldBy =>
      _$this._soldBy ??= new ListBuilder<String>();
  set soldBy(ListBuilder<String> soldBy) => _$this._soldBy = soldBy;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ProductsRecordBuilder() {
    ProductsRecord._initializeBuilder(this);
  }

  ProductsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _mainImage = $v.mainImage;
      _sku = $v.sku;
      _brand = $v.brand;
      _category = $v.category;
      _categoryId = $v.categoryId;
      _images = $v.images?.toBuilder();
      _views = $v.views;
      _likes = $v.likes;
      _sales = $v.sales;
      _brandLogo = $v.brandLogo;
      _owner = $v.owner;
      _sellers = $v.sellers?.toBuilder();
      _stores = $v.stores?.toBuilder();
      _lastSale = $v.lastSale;
      _soldBy = $v.soldBy?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsRecord;
  }

  @override
  void update(void Function(ProductsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductsRecord build() => _build();

  _$ProductsRecord _build() {
    _$ProductsRecord _$result;
    try {
      _$result = _$v ??
          new _$ProductsRecord._(
              id: id,
              title: title,
              description: description,
              mainImage: mainImage,
              sku: sku,
              brand: brand,
              category: category,
              categoryId: categoryId,
              images: _images?.build(),
              views: views,
              likes: likes,
              sales: sales,
              brandLogo: brandLogo,
              owner: owner,
              sellers: _sellers?.build(),
              stores: _stores?.build(),
              lastSale: lastSale,
              soldBy: _soldBy?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'sellers';
        _sellers?.build();
        _$failedField = 'stores';
        _stores?.build();

        _$failedField = 'soldBy';
        _soldBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProductsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
