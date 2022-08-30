
import 'package:flutter/material.dart';
import 'package:routine2/core/state_manager/app_state_manager.dart';
import 'package:provider/provider.dart';

AppBar customAppBarWithMenu(
    {required String title,
    required String profilePicUrl,
    required BuildContext context,
    void Function()? onTapped,
    required TextTheme primaryTextTheme}) {
 

  
  return AppBar(
    centerTitle: true,
    title: Text(
            title,
            style: primaryTextTheme.headline2,
          ),
    leading: Padding(
      padding:const EdgeInsets.all(5),
      child: IconButton(
        onPressed: onTapped,
        iconSize: 30,
        icon:const SizedBox(
          child: CircleAvatar(
                  radius: 15,
                  )
        ),
      ),
    ),
    actions: [
      InkWell(
              onTap: () {
                Provider.of<AppStateManager>(context, listen: false)
                    .setNotificationBadgetCounter(count: 0);
               
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Stack(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: Theme.of(context).primaryColor,
                      ),
                      Positioned(
                          right: 0,
                          top: 2,
                          child: Provider.of<AppStateManager>(context)
                                      .getNotificationBadgeCounter >
                                  0
                              ? Container(
                                  height: 11,
                                  width: 11,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                       const BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(
                                        color:
                                            Theme.of(context).backgroundColor,
                                        width: 1.5),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Container())
                    ],
                  ),
                ),
              ),
            )
    ],
    elevation: 0.3,
    toolbarHeight: 80,
  );
}
