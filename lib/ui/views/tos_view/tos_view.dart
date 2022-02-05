import 'package:Churpu/ui/views/tos_view/tos_view_model.dart';
import 'package:Churpu/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TosView extends StatelessWidget {
  final Widget drawerButton;
  static const String _title = 'Terms of Service | Privacy Policy';

  const TosView({Key? key, required this.drawerButton}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TosViewModel>.reactive(
        onModelReady: (model) {
        },
        viewModelBuilder: () => TosViewModel(),
        builder: (context, model, child) => CustomScaffold(
            title: _title,
            appBarLeading: drawerButton,
            body: Center(child: Text('TOS View'))
        )
    );
  }
}