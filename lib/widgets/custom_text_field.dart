import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget{
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.keyboardType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusColor: Theme.of(context).primaryColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
        ),
        labelText: hintText,
      ),
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
    );
  }
}