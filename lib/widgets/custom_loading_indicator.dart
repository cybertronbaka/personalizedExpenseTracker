import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: MediaQuery.of(context).size.height/15,
            child: LoadingIndicator(
                indicatorType: Indicator.ballClipRotate, /// Required, The loading type of the widget
                colors: const [Colors.blueAccent],       /// Optional, The color collections
                strokeWidth: 5,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                backgroundColor: Colors.transparent,      /// Optional, Background of the widget
                pathBackgroundColor: Colors.transparent   /// Optional, the stroke backgroundColor
            )
        )
    );
  }
}