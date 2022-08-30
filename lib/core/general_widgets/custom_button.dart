import 'package:flutter/material.dart';


ElevatedButton customButton(
    {required String label,
    required void Function() onPressed,
    Color buttonColor =const Color(0xff1F88C1),
    double radius = 30.0,
    double width = 300.0,
    double height = 50.0, bool loading = false, required TextTheme primaryTextTheme}) {
    
  
  return ElevatedButton(
    clipBehavior: Clip.hardEdge,
    onPressed:loading?null: onPressed,
    style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(width, height)),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        )),
        shadowColor:MaterialStateProperty.all(
         const Color(0xff4d4d4d),
        ) ,
        backgroundColor: MaterialStateProperty.all(
          loading ?const Color(0xff259ACB).withOpacity(0.6) : const Color(0xff1F88C1)
          
        )),
    child: loading? const CircularProgressIndicator(color: Colors.white,) : Text(label, style: primaryTextTheme.headline3!.copyWith(color: Colors.white)),
  );
}
