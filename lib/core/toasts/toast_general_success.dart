 
 import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

toastGeneralSuccess({required TextTheme primaryTextTheme, String successMessage ='Done'}) async {
   var custom = Container(
             height: 105,
             width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  padding:EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline,color: Colors.green[700],size:50),
                      SizedBox(height: 8,),
                      Text(successMessage, style: primaryTextTheme.headline3!.copyWith(color: Colors.white)),
                      
                    ],
                  ),
              );
              // here
             SmartDialog.show(widget: custom, isLoadingTemp: false,);
             await Future.delayed(const Duration(seconds: 2));
             SmartDialog.dismiss();
}
 
 
 
