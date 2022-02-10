import 'package:flutter/material.dart';

class CustomButtonBar extends StatelessWidget{
  final String text;
  final Color? primary;
  final Color? bgColor;
  final Size? size;
  final void Function()? onTap;
  final bool? border;

  const CustomButtonBar({
    Key? key,
    required this.text,
    this.primary,
    this.bgColor,
    this.size,
    this.onTap,
    this.border
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: primary != null ? primary : Colors.white,
        backgroundColor: bgColor != null ? bgColor : Theme.of(context).primaryColor,
        minimumSize: size != null ? size : Size(MediaQuery.of(context).size.width, 50),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          side: BorderSide(style: border != null ? BorderStyle.solid : BorderStyle.none, color: Colors.black38)
        ),
      ),
      onPressed: onTap,
      child: Text(text,
        style: TextStyle(
          color: primary != null ? primary : Colors.white
        )
      ),
    );
  }
}