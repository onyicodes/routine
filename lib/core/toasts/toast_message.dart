import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

toastMessage({required String message}) async {
  await SmartDialog.showToast(message, debounceTemp: true,);
}