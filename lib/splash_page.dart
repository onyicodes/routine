import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine2/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> animation2;
  late String logoUrl;
  late String logoDot;

  late AnimationController controller;
  late AnimationController controller2;
  late bool? isLightTheme;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    controller2 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0.27, end: 1.27).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.15, 1.0, curve: Curves.linear)));

    animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller2,
        curve: const Interval(0.0, 1.0, curve: Curves.linear)));

    controller.repeat();
    controller2.repeat();
  }

  @override
  void didChangeDependencies() async {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            Center(
              child: FadeTransition(
                opacity: animation2,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month),
                      Text(
                        'My Routine App',
                        style: primaryTextTheme.headline5!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
