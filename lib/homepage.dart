import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //ubah sharedprefs disini jadi false;

  bool isFirst;
  @override
  void initState() {
    super.initState();
    initShared();
  }

  initShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirst = prefs.getBool('is_first');

    if (isFirst == true) isFirst = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('homepage'),
      ),
    );
  }
}
