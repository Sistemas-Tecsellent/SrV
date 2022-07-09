// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<List<dynamic>> getApplicableVariants(
  String productId,
  String storeId,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference variantsCollection =
      firestore.collection('products/$productId/variants');
  var storeLocation = await firestore
      .doc('stores/$storeId')
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    return documentSnapshot['location'];
  });

  return await variantsCollection.get().then((QuerySnapshot querySnapshot) {
    var validRecords = []; //the list of formatted and applicable variants.
    var formattedVariant = {};

    //this variable tracks the records in which the location is the same of the user.
    var unitsThatOverrideOtherRecords = [];

    //this loop populates the previous list with records in which the location is equal to the user one
    for (var document in querySnapshot.docs) {
      formattedVariant = {}; //clearing just to be sure
      if (document['location'] == storeLocation) {
        formattedVariant['id'] = document['id'];
        formattedVariant['parentId'] = document['parentId'];
        formattedVariant['price'] = document['publicPrice'];
        formattedVariant['priceWithDiscount'] = document['publicPrice'];
        formattedVariant['unit'] = document['unit'];
        formattedVariant['tags'] = document['tags'];
        formattedVariant['discountRange1'] = document['discountRange1'];
        formattedVariant['discountRange2'] = document['discountRange2'];
        formattedVariant['discountRange3'] = document['discountRange3'];
        formattedVariant['discount1'] = document['discount1'];
        formattedVariant['discount2'] = document['discount2'];
        formattedVariant['discount3'] = document['discount3'];

        validRecords.add(formattedVariant);
        unitsThatOverrideOtherRecords.add(document['unit']);
      }
    }
    //Now we have the records that take precedence because of their location

    //if there are not records with location precedence
    if (unitsThatOverrideOtherRecords.isEmpty) {
      for (var document in querySnapshot.docs) {
        formattedVariant = {};
        if (document['location'] != 'global') {
          continue;
        }

        formattedVariant['id'] = document['id'];
        formattedVariant['parentId'] = document['parentId'];
        formattedVariant['price'] = document['publicPrice'];
        formattedVariant['priceWithDiscount'] = document['publicPrice'];
        formattedVariant['unit'] = document['unit'];
        formattedVariant['tags'] = document['tags'];
        formattedVariant['discountRange1'] = document['discountRange1'];
        formattedVariant['discountRange2'] = document['discountRange2'];
        formattedVariant['discountRange3'] = document['discountRange3'];
        formattedVariant['discount1'] = document['discount1'];
        formattedVariant['discount2'] = document['discount2'];
        formattedVariant['discount3'] = document['discount3'];
        validRecords.add(formattedVariant);
      }
    } else {
      //Looping through the list again to add the records that do not have a unit equal in the previous list
      for (var document in querySnapshot.docs) {
        formattedVariant = {};
        if (unitsThatOverrideOtherRecords.contains(document['unit'])) {
          continue;
        }

        formattedVariant['id'] = document['id'];
        formattedVariant['parentId'] = document['parentId'];
        formattedVariant['price'] = document['publicPrice'];
        formattedVariant['priceWithDiscount'] = document['publicPrice'];
        formattedVariant['unit'] = document['unit'];
        formattedVariant['tags'] = document['tags'];
        formattedVariant['discountRange1'] = document['discountRange1'];
        formattedVariant['discountRange2'] = document['discountRange2'];
        formattedVariant['discountRange3'] = document['discountRange3'];
        formattedVariant['discount1'] = document['discount1'];
        formattedVariant['discount2'] = document['discount2'];
        formattedVariant['discount3'] = document['discount3'];
        validRecords.add(formattedVariant);
      }
    }
    return validRecords;
  });
}
