// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/add_tag/add_tag_view.dart';
import '../ui/add_transaction/add_transaction_view.dart';
import '../ui/drawer/drawer_view.dart';

class Routes {
  static const String drawerView = '/';
  static const String addTagView = '/tags/addTag';
  static const String addTransactionView = '/add-transaction-view';
  static const all = <String>{
    drawerView,
    addTagView,
    addTransactionView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.drawerView, page: DrawerView),
    RouteDef(Routes.addTagView, page: AddTagView),
    RouteDef(Routes.addTransactionView, page: AddTransactionView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    DrawerView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DrawerView(),
        settings: data,
      );
    },
    AddTagView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddTagView(),
        settings: data,
      );
    },
    AddTransactionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddTransactionView(),
        settings: data,
      );
    },
  };
}
