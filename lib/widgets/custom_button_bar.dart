import 'package:flutter/material.dart';

class CustomButtonBar extends StatelessWidget{
  final String text;
  final Color? primary;
  final Color? bgColor;
  final Size? size;

  const CustomButtonBar({
    Key? key,
    required this.text,
    this.primary,
    this.bgColor,
    this.size
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: primary != null ? primary : Colors.white,
        backgroundColor: bgColor != null ? bgColor : Theme.of(context).primaryColor,
        minimumSize: size != null ? size : Size(MediaQuery.of(context).size.width, 50),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
      ),
      onPressed: () { },
      child: Text(text),
    );
  }
}