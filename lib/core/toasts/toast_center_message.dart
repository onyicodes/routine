import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

toastCenterMessage({required String message, double width = 100}) async {
 var custom = Container(
    height: 30,
    width: width,
    decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
    ),
    alignment: Alignment.center,
    child: Text(message,textAlign: TextAlign.center, style: TextStyle(
      color: Colors.white)),
);
// here
SmartDialog.show(widget: custom,maskColorTemp: Colors.transparent, isLoadingTemp: false);
await Future.delayed(Duration(seconds: 2));
SmartDialog.dismiss();
}