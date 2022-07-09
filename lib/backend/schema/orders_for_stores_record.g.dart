// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_for_stores_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrdersForStoresRecord> _$ordersForStoresRecordSerializer =
    new _$OrdersForStoresRecordSerializer();

class _$OrdersForStoresRecordSerializer
    implements StructuredSerializer<OrdersForStoresRecord> {
  @override
  final Iterable<Type> types = const [
    OrdersForStoresRecord,
    _$OrdersForStoresRecord
  ];
  @override
  final String wireName = 'OrdersForStoresRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, OrdersForStoresRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.bundleId;
    if (value != null) {
      result
        ..add('bundleId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderId;
    if (value != null) {
      result
        ..add('orderId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customerName;
    if (value != null) {
      result
        ..add('customerName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customerPhone;
    if (value != null) {
      result
        ..add('customerPhone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customerAddress;
    if (value != null) {
      result
        ..add('customerAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.seller;
    if (value != null) {
      result
        ..add('seller')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.store;
    if (value != null) {
      result
        ..add('store')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statusDetail;
    if (value != null) {
      result
        ..add('statusDetail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subtotal;
    if (value != null) {
      result
        ..add('subtotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.deliverer;
    if (value != null) {
      result
        ..add('deliverer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parcelName;
    if (value != null) {
      result
        ..add('parcelName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parcelGuide;
    if (value != null) {
      result
        ..add('parcelGuide')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parcelLink;
    if (value != null) {
      result
        ..add('parcelLink')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.guide;
    if (value != null) {
      result
        ..add('guide')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shipmentType;
    if (value != null) {
      result
        ..add('shipmentType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isFromSellerWiseOrder;
    if (value != null) {
      result
        ..add('isFromSellerWiseOrder')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.assignedDeliverer;
    if (value != null) {
      result
        ..add('assignedDeliverer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deliveredBy;
    if (value != null) {
      result
        ..add('deliveredBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.deliveredDay;
    if (value != null) {
      result
        ..add('deliveredDay')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deliveredDayInNumber;
    if (value != null) {
      result
        ..add('deliveredDayInNumber')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.deliveredMonth;
    if (value != null) {
      result
        ..add('deliveredMonth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deliveredYear;
    if (value != null) {
      result
        ..add('deliveredYear')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  OrdersForStoresRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrdersForStoresRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'bundleId':
          result.bundleId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'orderId':
          result.orderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerName':
          result.customerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerPhone':
          result.customerPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerAddress':
          result.customerAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'seller':
          result.seller = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'store':
          result.store = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'statusDetail':
          result.statusDetail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subtotal':
          result.subtotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'deliverer':
          result.deliverer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parcelName':
          result.parcelName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parcelGuide':
          result.parcelGuide = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parcelLink':
          result.parcelLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'guide':
          result.guide = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipmentType':
          result.shipmentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isFromSellerWiseOrder':
          result.isFromSellerWiseOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'assignedDeliverer':
          result.assignedDeliverer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deliveredBy':
          result.deliveredBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'deliveredDay':
          result.deliveredDay = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deliveredDayInNumber':
          result.deliveredDayInNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'deliveredMonth':
          result.deliveredMonth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deliveredYear':
          result.deliveredYear = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$OrdersForStoresRecord extends OrdersForStoresRecord {
  @override
  final String bundleId;
  @override
  final String orderId;
  @override
  final String id;
  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final String customerAddress;
  @override
  final String seller;
  @override
  final String store;
  @override
  final double total;
  @override
  final String status;
  @override
  final String statusDetail;
  @override
  final String type;
  @override
  final double subtotal;
  @override
  final String deliverer;
  @override
  final String parcelName;
  @override
  final String parcelGuide;
  @override
  final String parcelLink;
  @override
  final String guide;
  @override
  final String code;
  @override
  final String shipmentType;
  @override
  final bool isFromSellerWiseOrder;
  @override
  final String assignedDeliverer;
  @override
  final String deliveredBy;
  @override
  final DateTime createdDate;
  @override
  final String deliveredDay;
  @override
  final int deliveredDayInNumber;
  @override
  final String deliveredMonth;
  @override
  final int deliveredYear;
  @override
  final DocumentReference<Object> reference;

  factory _$OrdersForStoresRecord(
          [void Function(OrdersForStoresRecordBuilder) updates]) =>
      (new OrdersForStoresRecordBuilder()..update(updates)).build();

  _$OrdersForStoresRecord._(
      {this.bundleId,
      this.orderId,
      this.id,
      this.customerName,
      this.customerPhone,
      this.customerAddress,
      this.seller,
      this.store,
      this.total,
      this.status,
      this.statusDetail,
      this.type,
      this.subtotal,
      this.deliverer,
      this.parcelName,
      this.parcelGuide,
      this.parcelLink,
      this.guide,
      this.code,
      this.shipmentType,
      this.isFromSellerWiseOrder,
      this.assignedDeliverer,
      this.deliveredBy,
      this.createdDate,
      this.deliveredDay,
      this.deliveredDayInNumber,
      this.deliveredMonth,
      this.deliveredYear,
      this.reference})
      : super._();

  @override
  OrdersForStoresRecord rebuild(
          void Function(OrdersForStoresRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrdersForStoresRecordBuilder toBuilder() =>
      new OrdersForStoresRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrdersForStoresRecord &&
        bundleId == other.bundleId &&
        orderId == other.orderId &&
        id == other.id &&
        customerName == other.customerName &&
        customerPhone == other.customerPhone &&
        customerAddress == other.customerAddress &&
        seller == other.seller &&
        store == other.store &&
        total == other.total &&
        status == other.status &&
        statusDetail == other.statusDetail &&
        type == other.type &&
        subtotal == other.subtotal &&
        deliverer == other.deliverer &&
        parcelName == other.parcelName &&
        parcelGuide == other.parcelGuide &&
        parcelLink == other.parcelLink &&
        guide == other.guide &&
        code == other.code &&
        shipmentType == other.shipmentType &&
        isFromSellerWiseOrder == other.isFromSellerWiseOrder &&
        assignedDeliverer == other.assignedDeliverer &&
        deliveredBy == other.deliveredBy &&
        createdDate == other.createdDate &&
        deliveredDay == other.deliveredDay &&
        deliveredDayInNumber == other.deliveredDayInNumber &&
        deliveredMonth == other.deliveredMonth &&
        deliveredYear == other.deliveredYear &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, bundleId.hashCode), orderId.hashCode), id.hashCode), customerName.hashCode), customerPhone.hashCode), customerAddress.hashCode), seller.hashCode), store.hashCode), total.hashCode), status.hashCode),
                                                                                statusDetail.hashCode),
                                                                            type.hashCode),
                                                                        subtotal.hashCode),
                                                                    deliverer.hashCode),
                                                                parcelName.hashCode),
                                                            parcelGuide.hashCode),
                                                        parcelLink.hashCode),
                                                    guide.hashCode),
                                                code.hashCode),
                                            shipmentType.hashCode),
                                        isFromSellerWiseOrder.hashCode),
                                    assignedDeliverer.hashCode),
                                deliveredBy.hashCode),
                            createdDate.hashCode),
                        deliveredDay.hashCode),
                    deliveredDayInNumber.hashCode),
                deliveredMonth.hashCode),
            deliveredYear.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrdersForStoresRecord')
          ..add('bundleId', bundleId)
          ..add('orderId', orderId)
          ..add('id', id)
          ..add('customerName', customerName)
          ..add('customerPhone', customerPhone)
          ..add('customerAddress', customerAddress)
          ..add('seller', seller)
          ..add('store', store)
          ..add('total', total)
          ..add('status', status)
          ..add('statusDetail', statusDetail)
          ..add('type', type)
          ..add('subtotal', subtotal)
          ..add('deliverer', deliverer)
          ..add('parcelName', parcelName)
          ..add('parcelGuide', parcelGuide)
          ..add('parcelLink', parcelLink)
          ..add('guide', guide)
          ..add('code', code)
          ..add('shipmentType', shipmentType)
          ..add('isFromSellerWiseOrder', isFromSellerWiseOrder)
          ..add('assignedDeliverer', assignedDeliverer)
          ..add('deliveredBy', deliveredBy)
          ..add('createdDate', createdDate)
          ..add('deliveredDay', deliveredDay)
          ..add('deliveredDayInNumber', deliveredDayInNumber)
          ..add('deliveredMonth', deliveredMonth)
          ..add('deliveredYear', deliveredYear)
          ..add('reference', reference))
        .toString();
  }
}

class OrdersForStoresRecordBuilder
    implements Builder<OrdersForStoresRecord, OrdersForStoresRecordBuilder> {
  _$OrdersForStoresRecord _$v;

  String _bundleId;
  String get bundleId => _$this._bundleId;
  set bundleId(String bundleId) => _$this._bundleId = bundleId;

  String _orderId;
  String get orderId => _$this._orderId;
  set orderId(String orderId) => _$this._orderId = orderId;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _customerName;
  String get customerName => _$this._customerName;
  set customerName(String customerName) => _$this._customerName = customerName;

  String _customerPhone;
  String get customerPhone => _$this._customerPhone;
  set customerPhone(String customerPhone) =>
      _$this._customerPhone = customerPhone;

  String _customerAddress;
  String get customerAddress => _$this._customerAddress;
  set customerAddress(String customerAddress) =>
      _$this._customerAddress = customerAddress;

  String _seller;
  String get seller => _$this._seller;
  set seller(String seller) => _$this._seller = seller;

  String _store;
  String get store => _$this._store;
  set store(String store) => _$this._store = store;

  double _total;
  double get total => _$this._total;
  set total(double total) => _$this._total = total;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _statusDetail;
  String get statusDetail => _$this._statusDetail;
  set statusDetail(String statusDetail) => _$this._statusDetail = statusDetail;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  double _subtotal;
  double get subtotal => _$this._subtotal;
  set subtotal(double subtotal) => _$this._subtotal = subtotal;

  String _deliverer;
  String get deliverer => _$this._deliverer;
  set deliverer(String deliverer) => _$this._deliverer = deliverer;

  String _parcelName;
  String get parcelName => _$this._parcelName;
  set parcelName(String parcelName) => _$this._parcelName = parcelName;

  String _parcelGuide;
  String get parcelGuide => _$this._parcelGuide;
  set parcelGuide(String parcelGuide) => _$this._parcelGuide = parcelGuide;

  String _parcelLink;
  String get parcelLink => _$this._parcelLink;
  set parcelLink(String parcelLink) => _$this._parcelLink = parcelLink;

  String _guide;
  String get guide => _$this._guide;
  set guide(String guide) => _$this._guide = guide;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  String _shipmentType;
  String get shipmentType => _$this._shipmentType;
  set shipmentType(String shipmentType) => _$this._shipmentType = shipmentType;

  bool _isFromSellerWiseOrder;
  bool get isFromSellerWiseOrder => _$this._isFromSellerWiseOrder;
  set isFromSellerWiseOrder(bool isFromSellerWiseOrder) =>
      _$this._isFromSellerWiseOrder = isFromSellerWiseOrder;

  String _assignedDeliverer;
  String get assignedDeliverer => _$this._assignedDeliverer;
  set assignedDeliverer(String assignedDeliverer) =>
      _$this._assignedDeliverer = assignedDeliverer;

  String _deliveredBy;
  String get deliveredBy => _$this._deliveredBy;
  set deliveredBy(String deliveredBy) => _$this._deliveredBy = deliveredBy;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  String _deliveredDay;
  String get deliveredDay => _$this._deliveredDay;
  set deliveredDay(String deliveredDay) => _$this._deliveredDay = deliveredDay;

  int _deliveredDayInNumber;
  int get deliveredDayInNumber => _$this._deliveredDayInNumber;
  set deliveredDayInNumber(int deliveredDayInNumber) =>
      _$this._deliveredDayInNumber = deliveredDayInNumber;

  String _deliveredMonth;
  String get deliveredMonth => _$this._deliveredMonth;
  set deliveredMonth(String deliveredMonth) =>
      _$this._deliveredMonth = deliveredMonth;

  int _deliveredYear;
  int get deliveredYear => _$this._deliveredYear;
  set deliveredYear(int deliveredYear) => _$this._deliveredYear = deliveredYear;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  OrdersForStoresRecordBuilder() {
    OrdersForStoresRecord._initializeBuilder(this);
  }

  OrdersForStoresRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bundleId = $v.bundleId;
      _orderId = $v.orderId;
      _id = $v.id;
      _customerName = $v.customerName;
      _customerPhone = $v.customerPhone;
      _customerAddress = $v.customerAddress;
      _seller = $v.seller;
      _store = $v.store;
      _total = $v.total;
      _status = $v.status;
      _statusDetail = $v.statusDetail;
      _type = $v.type;
      _subtotal = $v.subtotal;
      _deliverer = $v.deliverer;
      _parcelName = $v.parcelName;
      _parcelGuide = $v.parcelGuide;
      _parcelLink = $v.parcelLink;
      _guide = $v.guide;
      _code = $v.code;
      _shipmentType = $v.shipmentType;
      _isFromSellerWiseOrder = $v.isFromSellerWiseOrder;
      _assignedDeliverer = $v.assignedDeliverer;
      _deliveredBy = $v.deliveredBy;
      _createdDate = $v.createdDate;
      _deliveredDay = $v.deliveredDay;
      _deliveredDayInNumber = $v.deliveredDayInNumber;
      _deliveredMonth = $v.deliveredMonth;
      _deliveredYear = $v.deliveredYear;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrdersForStoresRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrdersForStoresRecord;
  }

  @override
  void update(void Function(OrdersForStoresRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrdersForStoresRecord build() {
    final _$result = _$v ??
        new _$OrdersForStoresRecord._(
            bundleId: bundleId,
            orderId: orderId,
            id: id,
            customerName: customerName,
            customerPhone: customerPhone,
            customerAddress: customerAddress,
            seller: seller,
            store: store,
            total: total,
            status: status,
            statusDetail: statusDetail,
            type: type,
            subtotal: subtotal,
            deliverer: deliverer,
            parcelName: parcelName,
            parcelGuide: parcelGuide,
            parcelLink: parcelLink,
            guide: guide,
            code: code,
            shipmentType: shipmentType,
            isFromSellerWiseOrder: isFromSellerWiseOrder,
            assignedDeliverer: assignedDeliverer,
            deliveredBy: deliveredBy,
            createdDate: createdDate,
            deliveredDay: deliveredDay,
            deliveredDayInNumber: deliveredDayInNumber,
            deliveredMonth: deliveredMonth,
            deliveredYear: deliveredYear,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
