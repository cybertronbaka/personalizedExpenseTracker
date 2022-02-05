import 'package:Churpu/widgets/custom_bottom_modal.dart';
import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  static const icons = [Icons.edit, Icons.delete];
  static const items = ['Edit', 'Delete'];

  final int id;
  final String tagName;
  final String image;

  const TagCard({required this.id, required this.tagName, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showDefaultModal(context),
      child:  Card(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        tagName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        )
                    )
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                    width: 100,
                    height: 100,
                    child: Wrap(
                      children: [Image(image: AssetImage(image))],
                    )
                )
              ],
            ),
          )
      ),
    );
  }

  void _showDefaultModal(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) => CustomBottomModal(icons: icons, items: items)
    );
  }
}