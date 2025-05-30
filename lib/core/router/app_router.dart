import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:rivertodo/core/router/screens.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: ToDoListRoute.page, path: '/'),
    AutoRoute(page: ToDoEditRoute.page, path: '/edit'),
    AutoRoute(page: ToDoReadRoute.page, path: '/todos/:id'),
  ];
}
