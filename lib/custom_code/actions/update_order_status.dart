// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future updateOrderStatus(
  String orderId,
  String newStatus,
) async {
  var statusForAdmin = "";
  if (newStatus == "accepted") {
    statusForAdmin = "Aceptado";
  } else if (newStatus == "delivered") {
    statusForAdmin = "Enviado";
  } else if (newStatus == "waitingPickup") {
    statusForAdmin = "Esperando Recoleccion";
  } else if (newStatus == "onRoute") {
    statusForAdmin = "En Ruta";
  }
  await FirebaseFirestore.instance
      .doc('ordersForStores/$orderId')
      .update({'status': newStatus, 'statusForAdmin': statusForAdmin});
}
