import 'package:daily_app/home/Home.dart';
import 'package:daily_app/networking/FirstPage.dart';
import 'package:flutter/material.dart';

import 'add_training_page/AddTrainingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/addTraining': (context) => AddTrainingPage()
      },
    );
  }
}
