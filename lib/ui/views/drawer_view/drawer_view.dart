import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:stacked/stacked.dart';

import 'drawer_view_model.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  static const sections = [ 'Expenses', 'Incomes', 'Tags', 'Sync', 'Settings'];
  static const sectionIcons = [ Icons.money_off, Icons.attach_money_rounded, Icons.tag, Icons.sync,Icons.settings ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
      onModelReady: (model){
        model.setDrawerButton(
            IconButton(
              onPressed: model.handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: model.advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            )
        );
        model.setCurrentView(model.currentTitle);
      },
        viewModelBuilder: () => DrawerViewModel(),
        builder: (context, model, child) => AdvancedDrawer(
          backdropColor: Theme.of(context).primaryColor,
          controller: model.advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: model.getCurrentView(),
          drawer: customDrawer(context, model)
        )
    );
  }

  Widget customDrawer(context, model){
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/logo.png'),
              ),
              ...Iterable<int>.generate(sections.length).toList().map((i){
                return ListTile(
                  selected: model.isSelected(sections[i]),
                  selectedTileColor: Colors.white,
                  onTap: () => model.switchView(sections[i]),
                  leading: Icon(
                    sectionIcons[i],
                    color: model.isSelected(sections[i]) ?  Colors.blueAccent: Colors.white,
                  ),
                  title: Text(
                    sections[i],
                    style: TextStyle(
                      color: model.isSelected(sections[i]) ? Colors.blueAccent: Colors.white,
                      fontWeight: model.isSelected(sections[i]) ? FontWeight.bold : FontWeight.normal
                    )
                  ),
                );
              }).toList(),
              Spacer(),
              ListTile(
                onTap: () => model.switchView('Privacy Policy'),
                title: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
