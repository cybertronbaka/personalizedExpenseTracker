import 'package:Churpu/enums/transaction_types.dart';
import 'package:Churpu/ui/settings/settings_view.dart';
import 'package:Churpu/ui/tags/tags_view.dart';
import 'package:Churpu/ui/tos/tos_view.dart';
import 'package:Churpu/ui/transactions/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:stacked/stacked.dart';

class DrawerViewModel extends BaseViewModel{
  final advancedDrawerController = AdvancedDrawerController();

  String currentTitle = 'Expenses';
  late Widget currentView;
  late IconButton drawerButton;

  void setDrawerButton(IconButton drawerButton){
    this.drawerButton = drawerButton;
  }

  IconButton getDrawerButton(){
    return drawerButton;
  }

  String getCurrentTitle(){
    return currentTitle;
  }

  void setCurrentTitle(String title){
    currentTitle = title;
  }


  Widget getCurrentView(){
    return currentView;
  }

  void setCurrentView(String section){
    switch(section){
      case 'Expenses':
        currentView = TransactionView(drawerButton: drawerButton, transactionType: TransactionType.Expense);
        break;
      case 'Incomes':
        currentView = TransactionView(drawerButton: drawerButton, transactionType: TransactionType.Income);
        break;
      case 'Tags':
        currentView = TagsView(drawerButton: drawerButton);
        break;
      case 'Settings':
        currentView = SettingsView(drawerButton: drawerButton);
        break;
      case 'Privacy Policy':
        currentView = TosView(drawerButton: drawerButton);
    }
  }

  void switchView(String section){
    if(currentTitle == section) return;

    setCurrentTitle(section);
    setCurrentView(section);
    advancedDrawerController.hideDrawer();
    notifyListeners();
  }

  void handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }

  bool isSelected(String section){
    return currentTitle == section;
  }
}