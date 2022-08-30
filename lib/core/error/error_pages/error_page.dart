import 'package:flutter/material.dart';
import 'package:routine2/core/general_widgets/custom_button.dart';

Widget errorPage({required BuildContext context, String errorMessage = 'Oops! an error occurred',required void Function() onTapped }) {
  TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
  return ListView(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: [
      const SizedBox(height: 50,),
      //SvgPicture.asset('assets/svg_icons/error_icons/no_result_found_icon.svg', width: 150,),
      Align(
       alignment: Alignment.center,
       child: SizedBox(
         width: 100,
         child: Image.asset('assets/images/emoji/sad_face_emoji.png', width: 100,)),
     ),
     const SizedBox(height: 20,),
      Align(
        alignment: Alignment.center,
        child: Text(errorMessage, style: primaryTextTheme.headline2!.copyWith(color: Theme.of(context).primaryColor),)),
     const SizedBox(height: 50,),
      Align(
        alignment: Alignment.center,
        child: customButton(label: 'RELOAD',
        primaryTextTheme:primaryTextTheme,
         onPressed: onTapped,
        radius: 35
        )),
     const SizedBox(height: 30,),
      
    ],
  );
}