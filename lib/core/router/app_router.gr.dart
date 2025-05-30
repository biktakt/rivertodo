// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ToDoEditScreen]
class ToDoEditRoute extends PageRouteInfo<ToDoEditRouteArgs> {
  ToDoEditRoute({Key? key, int? todoId, List<PageRouteInfo>? children})
    : super(
        ToDoEditRoute.name,
        args: ToDoEditRouteArgs(key: key, todoId: todoId),
        initialChildren: children,
      );

  static const String name = 'ToDoEditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ToDoEditRouteArgs>(
        orElse: () => const ToDoEditRouteArgs(),
      );
      return ToDoEditScreen(key: args.key, todoId: args.todoId);
    },
  );
}

class ToDoEditRouteArgs {
  const ToDoEditRouteArgs({this.key, this.todoId});

  final Key? key;

  final int? todoId;

  @override
  String toString() {
    return 'ToDoEditRouteArgs{key: $key, todoId: $todoId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ToDoEditRouteArgs) return false;
    return key == other.key && todoId == other.todoId;
  }

  @override
  int get hashCode => key.hashCode ^ todoId.hashCode;
}

/// generated route for
/// [ToDoListPage]
class ToDoListRoute extends PageRouteInfo<void> {
  const ToDoListRoute({List<PageRouteInfo>? children})
    : super(ToDoListRoute.name, initialChildren: children);

  static const String name = 'ToDoListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ToDoListPage();
    },
  );
}

/// generated route for
/// [ToDoReadScreen]
class ToDoReadRoute extends PageRouteInfo<ToDoReadRouteArgs> {
  ToDoReadRoute({Key? key, required int todoId, List<PageRouteInfo>? children})
    : super(
        ToDoReadRoute.name,
        args: ToDoReadRouteArgs(key: key, todoId: todoId),
        initialChildren: children,
      );

  static const String name = 'ToDoReadRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ToDoReadRouteArgs>();
      return ToDoReadScreen(key: args.key, todoId: args.todoId);
    },
  );
}

class ToDoReadRouteArgs {
  const ToDoReadRouteArgs({this.key, required this.todoId});

  final Key? key;

  final int todoId;

  @override
  String toString() {
    return 'ToDoReadRouteArgs{key: $key, todoId: $todoId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ToDoReadRouteArgs) return false;
    return key == other.key && todoId == other.todoId;
  }

  @override
  int get hashCode => key.hashCode ^ todoId.hashCode;
}
