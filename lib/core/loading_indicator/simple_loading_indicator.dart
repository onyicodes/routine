import 'package:flutter/material.dart';

Widget simpleLoadingIndicator({String loadingMessage= 'loading...', required TextTheme primaryTextTheme}) {
  return  Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       const SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 4,
          ),
        ),
       const SizedBox(height: 12,),
        Text(loadingMessage, style: primaryTextTheme.bodyText1,)
      ],
    ),
  );
}
