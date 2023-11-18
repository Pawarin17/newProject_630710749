import 'package:flutter/material.dart';
import 'package:order_project/screens/add_order.dart';
import 'package:order_project/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      AddScreen.routeName: (context) => AddScreen(),
    },
    );
  }
}
