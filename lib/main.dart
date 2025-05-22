import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/FoodTracking.dart';
import 'package:flutter_app/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue.shade500),
        home: App());
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("App"),
            backgroundColor: Colors.blue.shade500,
            centerTitle: true,
        ),
        drawer: Drawer(
            child: ListView(
                
            ),
        ),
    );
  }
}
