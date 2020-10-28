import 'package:flutter/material.dart';
import 'package:pinterest/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinterest',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      onGenerateRoute: (settings){
        switch(settings.name){
          case HomePage.route:
            return MaterialPageRoute(builder: (_) => HomePage());
          default:
            return MaterialPageRoute(builder: (_) => HomePage());
        }
      },
    );
  }
}
