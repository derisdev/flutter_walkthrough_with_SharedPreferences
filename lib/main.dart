import 'package:flutter/material.dart';
import 'package:page_indicator/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './page_view.dart';

void main() {
  runApp(GymApp());
}

class GymApp extends StatefulWidget {
  const GymApp({Key key}) : super(key: key);

  @override
  _GymAppState createState() => _GymAppState();
}

class _GymAppState extends State<GymApp> {
  //ini yang penting, agar halaman ditampilkan hanya sekali
  bool isFirst;
  @override
  void initState() {
    super.initState();
    initShared();
  }

  initShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirst = prefs.getBool('is_first');

    if (isFirst == null) isFirst = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suket App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isFirst ? GymTutorial() : HomePage(),
    );
  }
}
