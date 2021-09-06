//import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_app/router/ui_pages.dart';
import '../app_state.dart';
import '../ui/cart.dart';
import '../ui/details.dart';
import '../ui/checkout.dart';
import '../ui/create_account.dart';
import '../ui/list_items.dart';
import '../ui/login.dart';
import '../ui/settings.dart';
import '../ui/splash.dart';

//1
class ShoppingRouterDelegate extends RouterDelegate<PageConfiguration>
//2
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<PageConfiguration> {
  //3
  final List<Page> _pages = [];

  //4
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  //5
  final AppState appState;

  //6
  ShoppingRouterDelegate(this.appState) : navigatorKey = GlobalKey() {
    appState.addListener(() {
      notifyListeners();
    });
  }

  //7
  /// Getter for a list that cannot be changed
  List<MaterialPage> get pages => List.unmodifiable(_pages);

  /// Number of pages function
  int numPages() => _pages.length;

  //8
  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;
}
