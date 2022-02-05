import 'package:Churpu/ui/views/drawer_view/drawer_view.dart';
import 'package:Churpu/utils/churpu_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  FlutterNativeSplash.removeAfter(initialization);
  runApp(MyApp());
}

void initialization(BuildContext context) async {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Churpu',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueAccent,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.blueGrey
        ),
        backgroundColor: Colors.white10,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: DrawerView(),
      debugShowCheckedModeBanner: false,
    );
  }
}