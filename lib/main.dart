import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertodo/core/di/injection.dart' as di;
import 'package:rivertodo/core/router/app_router.dart';
import 'package:rivertodo/core/styles/theme.dart';
import 'package:rivertodo/core/styles/theme_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependencies();

  final container = ProviderContainer();

  runApp(
    UncontrolledProviderScope(container: container, child: const AppRoot()),
  );
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppThemeMode(child: App());
  }
}

final _appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ToDo App',
      theme: AppThemeScheme.lightTheme,
      darkTheme: AppThemeScheme.darkTheme,
      themeMode: AppThemeMode.of(context),
      routerConfig: _appRouter.config(),
    );
  }
}
