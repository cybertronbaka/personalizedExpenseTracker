// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/drawer/drawer_view.dart';

class Routes {
  static const String drawerView = '/';
  static const all = <String>{
    drawerView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.drawerView, page: DrawerView),
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
  };
}
