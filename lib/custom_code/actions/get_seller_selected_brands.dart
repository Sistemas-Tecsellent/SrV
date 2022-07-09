// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<List<dynamic>> getSellerSelectedBrands(String uid) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference sellerBrandsCollection =
      firestore.collection('sellers/$uid/brands');
  CollectionReference brandsCollection = firestore.collection('brands');

  var sellerBrands =
      await sellerBrandsCollection.get().then((QuerySnapshot querySnapshot) {
    var brandsInSellerAccount = [];
    for (var doc in querySnapshot.docs) {
      brandsInSellerAccount.add(doc['id']);
    }
    return brandsInSellerAccount;
  });

  return await brandsCollection.get().then((QuerySnapshot querySnapshot) {
    var validBrands = [];

    var brandObj = {};
    for (var document in querySnapshot.docs) {
      brandObj = {};
      if (sellerBrands.contains(document['id'])) {
        brandObj['id'] = document['id'];
        brandObj['logo'] = document['logo'];
        validBrands.add(brandObj);
      }
    }

    return validBrands;
  });
}
