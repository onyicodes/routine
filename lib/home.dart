import 'package:flutter/material.dart';
import 'package:routine2/features/routine/presentation/pages/routine_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key,}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routine'),
      ),
      body: RoutinePage(),
    );
  }
}