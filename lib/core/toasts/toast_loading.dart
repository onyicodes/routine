import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

toastLoading({required bool isLoading,required String loadingMessage}) async{
   SmartDialog.showLoading(backDismiss: false, msg: loadingMessage);
    isLoading? Container(): SmartDialog.dismiss();
}