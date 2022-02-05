import 'package:Churpu/ui/views/settings_view/settings_view_model.dart';
import 'package:Churpu/widgets/custom_scaffold.dart';
import 'package:Churpu/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  final Widget drawerButton;
  static const String _title = 'Settings';

  const SettingsView({Key? key, required this.drawerButton}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        onModelReady: (model) {
        },
        viewModelBuilder: () => SettingsViewModel(),
        builder: (context, model, child) => CustomScaffold(
          title: _title,
          appBarLeading: drawerButton,
          body: Center(child: Text('Settings View'))
        )
    );
  }
}