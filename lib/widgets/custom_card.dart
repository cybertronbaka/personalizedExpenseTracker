import 'package:Churpu/utils/date_formatter.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_modal.dart';

class CustomCard extends StatelessWidget {
  static const List<IconData> icons = [Icons.attach_money, Icons.date_range, Icons.tag, Icons.delete];
  static const List<String> items = ['Change Amount', 'Change Date', 'Change Tag', 'Delete'];

  final int id;
  final int tagId;
  final String tagName;
  final DateTime dateTime;
  final Image image;
  final double amount;

  const CustomCard({
    required this.id,
    required this.tagId,
    required this.tagName,
    required this.dateTime,
    required this.image,
    required this.amount
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 5),
        GestureDetector(
          onLongPress: () => _showDefaultBottomModal(context),
          child: Card(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tagName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      //body
                      Row(
                        children: [
                          Container(
                              width: 100,
                              height: 100,
                              child: Wrap(
                                children: [
                                  image
                                ],
                              )
                          ),
                          Container(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.date_range_rounded),
                                  Container(width: 15),
                                  Text(
                                      DateFormatter().getHumanizedDate(dateTime),
                                      style: TextStyle(
                                          fontSize: 16
                                      )
                                  )
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Container(
                                      width: 30,
                                      height: 30,
                                      child: Wrap(
                                        children: [Image(image: AssetImage('assets/money.png'))],
                                      )
                                  ),
                                  Container(width: 10),
                                  Text(
                                      'Nu. ' + amount.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16)
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
              )
          ),
        ),
        Container(height: 5),
      ],
    );
  }

  void _showDefaultBottomModal(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) => CustomBottomModal(icons: icons, items: items)
    );
  }
}