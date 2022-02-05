import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final PreferredSizeWidget? appBarBottom;
  final Widget? appBarLeading;
  final Widget? drawer;

  const CustomScaffold({required this.title, required this.body, this.appBarBottom, this.drawer, this.appBarLeading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
        titleTextStyle: TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        bottom: appBarBottom,
        leading: appBarLeading,
        ),
      backgroundColor: Colors.white,
      body: body,
      resizeToAvoidBottomInset: false,
      drawer: drawer,
    );
  }
}