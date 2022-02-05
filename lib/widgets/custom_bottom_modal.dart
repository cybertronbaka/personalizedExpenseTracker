import 'package:flutter/material.dart';

class CustomBottomModal extends StatelessWidget{
  final List<IconData> icons;
  final List<String> items;

  const CustomBottomModal({
    Key? key,
    required this.icons,
    required this.items
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: Iterable.generate(items.length).toList().map((i){
        return ListTile(
          leading: Icon(icons[i]),
          title: Text(
            items[i],
            style: TextStyle(
              fontSize: 16
            ),
          ),
        );
      }).toList(),
    );
  }
}