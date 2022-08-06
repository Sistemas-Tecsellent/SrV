// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<List<dynamic>> getVariantsInventoryForSeller(
  String storeId,
  List<dynamic> validVariants,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  for (var variant in validVariants) {
    await firestore
        .collection(
            'products/${variant['parentId']}/variants/${variant['id']}/inventories')
        .doc(storeId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      variant['inventory'] = documentSnapshot['inventory'];
      variant['publicPriceEnabled'] = documentSnapshot['publicPriceEnabled'];
      variant['wholesalePriceEnabled'] =
          documentSnapshot['wholesalePriceEnabled'];
      variant['megaWholesalePriceEnabled'] =
          documentSnapshot['megaWholesalePriceEnabled'];
      variant['discount1Enabled'] = documentSnapshot['discount1Enabled'];
      variant['discount2Enabled'] = documentSnapshot['discount2Enabled'];
      variant['discount3Enabled'] = documentSnapshot['discount3Enabled'];
    }).catchError((error, stackTrace) {
      variant['inventory'] = 0;
      variant['publicPriceEnabled'] = false;
      variant['wholesalePriceEnabled'] = false;
      variant['megaWholesalePriceEnabled'] = false;
      variant['discount1Enabled'] = false;
      variant['discount2Enabled'] = false;
      variant['discount3Enabled'] = false;
    });
  }

  return validVariants;
}
