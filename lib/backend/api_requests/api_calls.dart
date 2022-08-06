import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetOrderForStoreInfoCall {
  static Future<ApiCallResponse> call({
    String orderId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderForStoreInfo',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getOrderForStoreInfo',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'orderId': orderId,
      },
      returnBody: true,
    );
  }

  static dynamic products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
      );
}

class AddToRecentlyAddedCall {
  static Future<ApiCallResponse> call({
    String productId = '',
    String sellerId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'addToRecentlyAdded',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/addToRecentlyAdded',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'productId': productId,
        'sellerId': sellerId,
      },
      returnBody: true,
    );
  }
}

class AssociateDelivererCall {
  static Future<ApiCallResponse> call({
    String delivererId = '',
    String storeId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'associateDeliverer',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/associateDeliverer',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'delivererId': delivererId,
        'storeId': storeId,
      },
      returnBody: true,
    );
  }
}

class GetTotalVariantInventoryByStoreCall {
  static Future<ApiCallResponse> call({
    String productId = '',
    String variantId = '',
    String store = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTotalVariantInventoryByStore',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getTotalVariantInventoryByStore',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'productId': productId,
        'variantId': variantId,
        'store': store,
      },
      returnBody: true,
    );
  }

  static dynamic inventory(dynamic response) => getJsonField(
        response,
        r'''$.inventory''',
      );
}

class StoreHasProductsCall {
  static Future<ApiCallResponse> call({
    String storeId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'storeHasProducts',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/storeHasProducts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'storeId': storeId,
      },
      returnBody: true,
    );
  }

  static dynamic response(dynamic response) => getJsonField(
        response,
        r'''$.response''',
      );
}

class GetApplicableVariantsCall {
  static Future<ApiCallResponse> call({
    String productId = '',
    String userLocation = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getApplicableVariants',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getApplicableVariants',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'productId': productId,
        'userLocation': userLocation,
      },
      returnBody: true,
    );
  }

  static dynamic variants(dynamic response) => getJsonField(
        response,
        r'''$.variants''',
      );
}

class PrepareExpressOrderOwnDeliveryCall {
  static Future<ApiCallResponse> call({
    String bundleId = '',
    String delivererId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'prepareExpressOrderOwnDelivery',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/prepareExpressOrderOwnDelivery',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'bundleId': bundleId,
        'delivererId': delivererId,
      },
      returnBody: true,
    );
  }
}

class PrepareNormalOrderDeliveryCall {
  static Future<ApiCallResponse> call({
    String delivererId = '',
    String bundleId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'prepareNormalOrderDelivery',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/prepareNormalOrderDelivery',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'delivererId': delivererId,
        'bundleId': bundleId,
      },
      returnBody: true,
    );
  }
}

class PrepareNormalOrderOtherDeliveryCall {
  static Future<ApiCallResponse> call({
    String bundleId = '',
    String parcelName = '',
    String parcelGuide = '',
    String parcelLink = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'prepareNormalOrderOtherDelivery',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/prepareNormalOrderOtherDelivery',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'bundleId': bundleId,
        'parcelName': parcelName,
        'parcelGuide': parcelGuide,
        'parcelLink': parcelLink,
      },
      returnBody: true,
    );
  }
}

class DeliverNormalOrderByThirdPartyCall {
  static Future<ApiCallResponse> call({
    String bundleId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deliverNormalOrderByThirdParty',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/deliverNormalOrderByThirdParty',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'bundleId': bundleId,
      },
      returnBody: true,
    );
  }
}

class IsSellerApprovedCall {
  static Future<ApiCallResponse> call({
    String userEmail = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'isSellerApproved',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/isSellerApproved',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userEmail': userEmail,
      },
      returnBody: true,
    );
  }

  static dynamic isApproved(dynamic response) => getJsonField(
        response,
        r'''$.isApproved''',
      );
}

class GetPricingRequestInfoCall {
  static Future<ApiCallResponse> call({
    String requestId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPricingRequestInfo',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getPricingRequestInfo',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'requestId': requestId,
      },
      returnBody: true,
    );
  }
}

class UpdatePricingRequestCall {
  static Future<ApiCallResponse> call({
    String requestId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'updatePricingRequest',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/updatePricingRequest',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'requestId': requestId,
      },
      returnBody: true,
    );
  }
}

class GetPricingRequestAdminToStoreCall {
  static Future<ApiCallResponse> call({
    String requestId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPricingRequestAdminToStore',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getPricingRequestAdminToStore',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'requestId': requestId,
      },
      returnBody: true,
    );
  }
}

class HasCompletedRegistrationCall {
  static Future<ApiCallResponse> call({
    String sellerId = '',
    String storeId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'hasCompletedRegistration',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/hasCompletedRegistration',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'sellerId': sellerId,
        'storeId': storeId,
      },
      returnBody: true,
    );
  }

  static dynamic complete(dynamic response) => getJsonField(
        response,
        r'''$.complete''',
      );
  static dynamic page(dynamic response) => getJsonField(
        response,
        r'''$.page''',
      );
}
