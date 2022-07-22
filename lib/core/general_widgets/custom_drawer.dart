import 'package:flutter/material.dart';
import 'package:routine2/core/state_manager/app_state_manager.dart';
import 'package:provider/provider.dart';

Drawer customDrawer(
    {required String profilePicUrl,
    required BuildContext context,
    required TextTheme primaryTextTheme}) {
  bool? isLightTheme = Provider.of<AppStateManager>(context).isLightTheme;
  Color textColor = Colors.white;
  return Drawer(
    width: MediaQuery.of(context).size.width * 0.75,
    backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
    elevation: 0,
    child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              DrawerHeader(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 40, ),
                  
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 115,
                        child: Text(
                          '👋 Hello, User',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: primaryTextTheme.headline3!
                              .copyWith(color: textColor),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      
                      SizedBox(
                        height: 16.0,
                      ),
                    ],
                  )
                ],
              )),
              ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.star,
                    color: textColor,
                  ),
                  title: Text('Rate app',
                      style: primaryTextTheme.bodyText1!
                          .copyWith(color: textColor))),
              ListTile(
                  leading: Icon(
                    Icons.share,
                    color: textColor,
                  ),
                  title: Text('Invite a friend',
                      style: primaryTextTheme.bodyText1!
                          .copyWith(color: textColor))),
              ListTile(
                onTap: () {
                  Provider.of<AppStateManager>(context, listen: false)
                      .setNotificationBadgetCounter(count: 0);
                  
                },
                leading: Icon(
                  Icons.notifications_active,
                  color: textColor,
                ),
                title: Text('Notifications',
                    style: primaryTextTheme.bodyText1!
                        .copyWith(color: textColor)),
              ),
              ListTile(
                  onTap: () {
                  
                  },
                  leading: Icon(
                    Icons.comment,
                    color:textColor,
                  ),
                  title: Text('Feedback',
                      style: primaryTextTheme.bodyText1!
                          .copyWith(color: textColor))),
              ListTile(
                  leading: Icon(Icons.playlist_add_check_outlined,
                    color: textColor,
                  ),
                  title: Text('Terms & Conditions',
                      style: primaryTextTheme.bodyText1!
                          .copyWith(color: textColor))),
              ListTile(
                onTap: () {
                  changeThemePopup(
                      context: context,
                      primaryTextTheme: primaryTextTheme,
                      isLightTheme: isLightTheme);
                },
                leading: Icon(
                  Icons.sunny_snowing,
                  color: textColor,
                ),
                title: Text('Theme',
                    style: primaryTextTheme.bodyText1!
                        .copyWith(color: textColor)),
                subtitle: Text(
                  isLightTheme == null
                      ? 'System default'
                      : isLightTheme
                          ? 'Light mode'
                          : 'Dark mode',
                  style: primaryTextTheme.bodyText1!
                      .copyWith(color: textColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Container(
            width: 180,
            decoration: BoxDecoration(
              border: Border.all(color: textColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(16))),
            child: ListTile(
                onTap: () {
                  
                },
                leading: Icon(
                  Icons.logout,
                  color: textColor,
                ),
                title: Text('Logout',
                    style: primaryTextTheme.bodyText1!
                        .copyWith(color: textColor))),
          ),
          SizedBox(height: 100,)
        ],
      ),
    ),
  );
}


changeThemePopup(
    {required BuildContext context,
    required TextTheme primaryTextTheme,
    required bool? isLightTheme}) async {
  print(isLightTheme);
  return await showDialog(
      context: context,
      builder: (context) {
        bool? isLight = isLightTheme;
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            title: Text("Choose theme", style: primaryTextTheme.headline2),
            content: SizedBox(
              height: 180,
              child: Column(
                children: [
                  RadioListTile(
                      value: isLight == null ? true : false,
                      groupValue: true,
                      title: Text(
                        'System default',
                        style: primaryTextTheme.bodyText1,
                      ),
                      onChanged: (bool? change) {
                        setState(() {
                          isLight = null;
                        });
                        print(isLight);
                      }),
                  RadioListTile(
                      value: isLight ?? false,
                      groupValue: true,
                      title: Text(
                        'Light mode',
                        style: primaryTextTheme.bodyText1,
                      ),
                      onChanged: (bool? change) {
                        setState(() {
                          isLight = true;
                        });
                      }),
                  RadioListTile(
                      value: isLight == false ? true : false,
                      title: Text(
                        'Dark mode',
                        style: primaryTextTheme.bodyText1,
                      ),
                      groupValue: true,
                      onChanged: (bool? change) {
                        setState(() {
                          isLight = false;
                        });
                      })
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Provider.of<AppStateManager>(context, listen: false)
                        .setAppThemeState(isLightTheme: isLight);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          );
        });
      });
}