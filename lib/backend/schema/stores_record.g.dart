// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoresRecord> _$storesRecordSerializer =
    new _$StoresRecordSerializer();

class _$StoresRecordSerializer implements StructuredSerializer<StoresRecord> {
  @override
  final Iterable<Type> types = const [StoresRecord, _$StoresRecord];
  @override
  final String wireName = 'StoresRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, StoresRecord object,
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
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locationCity;
    if (value != null) {
      result
        ..add('locationCity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.enabledDays;
    if (value != null) {
      result
        ..add('enabledDays')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.banner;
    if (value != null) {
      result
        ..add('banner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mapLocation;
    if (value != null) {
      result
        ..add('mapLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.openHours;
    if (value != null) {
      result
        ..add('openHours')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.closedHours;
    if (value != null) {
      result
        ..add('closedHours')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.transports;
    if (value != null) {
      result
        ..add('transports')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.activeProducts;
    if (value != null) {
      result
        ..add('activeProducts')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isApproved;
    if (value != null) {
      result
        ..add('isApproved')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  StoresRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoresRecordBuilder();

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
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'locationCity':
          result.locationCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'enabledDays':
          result.enabledDays.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'banner':
          result.banner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mapLocation':
          result.mapLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'openHours':
          result.openHours.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'closedHours':
          result.closedHours.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'transports':
          result.transports.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'activeProducts':
          result.activeProducts.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'isApproved':
          result.isApproved = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$StoresRecord extends StoresRecord {
  @override
  final String id;
  @override
  final String owner;
  @override
  final String name;
  @override
  final String location;
  @override
  final String locationCity;
  @override
  final BuiltList<String> enabledDays;
  @override
  final String logo;
  @override
  final String banner;
  @override
  final LatLng mapLocation;
  @override
  final String address;
  @override
  final BuiltList<String> openHours;
  @override
  final BuiltList<String> closedHours;
  @override
  final BuiltList<String> transports;
  @override
  final BuiltList<String> activeProducts;
  @override
  final bool isApproved;
  @override
  final DocumentReference<Object> reference;

  factory _$StoresRecord([void Function(StoresRecordBuilder) updates]) =>
      (new StoresRecordBuilder()..update(updates)).build();

  _$StoresRecord._(
      {this.id,
      this.owner,
      this.name,
      this.location,
      this.locationCity,
      this.enabledDays,
      this.logo,
      this.banner,
      this.mapLocation,
      this.address,
      this.openHours,
      this.closedHours,
      this.transports,
      this.activeProducts,
      this.isApproved,
      this.reference})
      : super._();

  @override
  StoresRecord rebuild(void Function(StoresRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoresRecordBuilder toBuilder() => new StoresRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoresRecord &&
        id == other.id &&
        owner == other.owner &&
        name == other.name &&
        location == other.location &&
        locationCity == other.locationCity &&
        enabledDays == other.enabledDays &&
        logo == other.logo &&
        banner == other.banner &&
        mapLocation == other.mapLocation &&
        address == other.address &&
        openHours == other.openHours &&
        closedHours == other.closedHours &&
        transports == other.transports &&
        activeProducts == other.activeProducts &&
        isApproved == other.isApproved &&
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
                                                                $jc(0,
                                                                    id.hashCode),
                                                                owner.hashCode),
                                                            name.hashCode),
                                                        location.hashCode),
                                                    locationCity.hashCode),
                                                enabledDays.hashCode),
                                            logo.hashCode),
                                        banner.hashCode),
                                    mapLocation.hashCode),
                                address.hashCode),
                            openHours.hashCode),
                        closedHours.hashCode),
                    transports.hashCode),
                activeProducts.hashCode),
            isApproved.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StoresRecord')
          ..add('id', id)
          ..add('owner', owner)
          ..add('name', name)
          ..add('location', location)
          ..add('locationCity', locationCity)
          ..add('enabledDays', enabledDays)
          ..add('logo', logo)
          ..add('banner', banner)
          ..add('mapLocation', mapLocation)
          ..add('address', address)
          ..add('openHours', openHours)
          ..add('closedHours', closedHours)
          ..add('transports', transports)
          ..add('activeProducts', activeProducts)
          ..add('isApproved', isApproved)
          ..add('reference', reference))
        .toString();
  }
}

class StoresRecordBuilder
    implements Builder<StoresRecord, StoresRecordBuilder> {
  _$StoresRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  String _locationCity;
  String get locationCity => _$this._locationCity;
  set locationCity(String locationCity) => _$this._locationCity = locationCity;

  ListBuilder<String> _enabledDays;
  ListBuilder<String> get enabledDays =>
      _$this._enabledDays ??= new ListBuilder<String>();
  set enabledDays(ListBuilder<String> enabledDays) =>
      _$this._enabledDays = enabledDays;

  String _logo;
  String get logo => _$this._logo;
  set logo(String logo) => _$this._logo = logo;

  String _banner;
  String get banner => _$this._banner;
  set banner(String banner) => _$this._banner = banner;

  LatLng _mapLocation;
  LatLng get mapLocation => _$this._mapLocation;
  set mapLocation(LatLng mapLocation) => _$this._mapLocation = mapLocation;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  ListBuilder<String> _openHours;
  ListBuilder<String> get openHours =>
      _$this._openHours ??= new ListBuilder<String>();
  set openHours(ListBuilder<String> openHours) => _$this._openHours = openHours;

  ListBuilder<String> _closedHours;
  ListBuilder<String> get closedHours =>
      _$this._closedHours ??= new ListBuilder<String>();
  set closedHours(ListBuilder<String> closedHours) =>
      _$this._closedHours = closedHours;

  ListBuilder<String> _transports;
  ListBuilder<String> get transports =>
      _$this._transports ??= new ListBuilder<String>();
  set transports(ListBuilder<String> transports) =>
      _$this._transports = transports;

  ListBuilder<String> _activeProducts;
  ListBuilder<String> get activeProducts =>
      _$this._activeProducts ??= new ListBuilder<String>();
  set activeProducts(ListBuilder<String> activeProducts) =>
      _$this._activeProducts = activeProducts;

  bool _isApproved;
  bool get isApproved => _$this._isApproved;
  set isApproved(bool isApproved) => _$this._isApproved = isApproved;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  StoresRecordBuilder() {
    StoresRecord._initializeBuilder(this);
  }

  StoresRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _owner = $v.owner;
      _name = $v.name;
      _location = $v.location;
      _locationCity = $v.locationCity;
      _enabledDays = $v.enabledDays?.toBuilder();
      _logo = $v.logo;
      _banner = $v.banner;
      _mapLocation = $v.mapLocation;
      _address = $v.address;
      _openHours = $v.openHours?.toBuilder();
      _closedHours = $v.closedHours?.toBuilder();
      _transports = $v.transports?.toBuilder();
      _activeProducts = $v.activeProducts?.toBuilder();
      _isApproved = $v.isApproved;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoresRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoresRecord;
  }

  @override
  void update(void Function(StoresRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoresRecord build() {
    _$StoresRecord _$result;
    try {
      _$result = _$v ??
          new _$StoresRecord._(
              id: id,
              owner: owner,
              name: name,
              location: location,
              locationCity: locationCity,
              enabledDays: _enabledDays?.build(),
              logo: logo,
              banner: banner,
              mapLocation: mapLocation,
              address: address,
              openHours: _openHours?.build(),
              closedHours: _closedHours?.build(),
              transports: _transports?.build(),
              activeProducts: _activeProducts?.build(),
              isApproved: isApproved,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'enabledDays';
        _enabledDays?.build();

        _$failedField = 'openHours';
        _openHours?.build();
        _$failedField = 'closedHours';
        _closedHours?.build();
        _$failedField = 'transports';
        _transports?.build();
        _$failedField = 'activeProducts';
        _activeProducts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StoresRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
