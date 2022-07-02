// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<String> updateVariantInventory(
  String sellerId,
  String variantId,
  int inventory,
  bool publicPriceEnabled,
  bool wholesalePriceEnabled,
  bool megaWholesalePriceEnabled,
  bool discount1Enabled,
  bool discount2Enabled,
  bool discount3Enabled,
  String productId,
  String storeId,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  return await firestore
      .collection('products/$productId/variants/$variantId/inventories')
      .doc(storeId)
      .set({
    "sellerId": sellerId,
    "storeId": storeId,
    "inventory": inventory,
    "publicPriceEnabled": publicPriceEnabled,
    "wholesalePriceEnabled": wholesalePriceEnabled,
    "megaWholesalePriceEnabled": megaWholesalePriceEnabled,
    "discount1Enabled": discount1Enabled,
    "discount2Enabled": discount2Enabled,
    "discount3Enabled": discount3Enabled,
  }, SetOptions(merge: true)).then((value) {
    return "Success";
  }).catchError((error) {
    return "Error";
  });
}
