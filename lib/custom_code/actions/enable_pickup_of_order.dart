// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future enablePickupOfOrder(String bundleId) async {
  await FirebaseFirestore.instance
      .collection('deliveryOrders')
      .where('orderBundle', isEqualTo: bundleId)
      .get()
      .then((QuerySnapshot querySnapshot) async {
    var delOrderId = querySnapshot.docs[0]['id'];
    await FirebaseFirestore.instance
        .doc('deliveryOrders/$delOrderId')
        .update({'currentObjective.canPickup': true});
  });
}
