import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

AppBar customAppBar(
    {required String title,
    required BuildContext context,
    List<Widget> action = const <Widget>[],
    void Function()? onTapped,
    required TextTheme primaryTextTheme}) {
  return AppBar(
    title: Text(
      title,
      style: primaryTextTheme.headline3,
    ),
    actions: action,
    leading: SizedBox(
      width: 30,
      child: IconButton(
          onPressed: onTapped ??
              () {
                Navigator.of(context).pop();
              },
          icon: Icon(
            Icons.arrow_left,
            color: Theme.of(context).iconTheme.color,
            size: 30,
          )),
    ),
    elevation: 0.3,
    toolbarHeight: 70,
  );
}
