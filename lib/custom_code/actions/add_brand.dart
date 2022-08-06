// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future addBrand(String uid, String brandId, String storeId) async {
  await FirebaseFirestore.instance
      .collection('sellers/$uid/brands')
      .doc(brandId)
      .set({
    'id': brandId,
    'active': true,
  });
  await FirebaseFirestore.instance
      .collection('stores/$storeId/storeBrands')
      .doc(brandId)
      .set({
    'id': brandId,
    'active': true,
  });
}
