import 'package:flutter/material.dart';
import 'package:flutter_project/app_state.dart';
import 'package:flutter_project/src/screens/home_page.dart';
import 'package:flutter_project/src/screens/signin_page.dart';
import 'package:flutter_project/src/screens/sales_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const MainApp()),
  ));

}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Consumer<ApplicationState>(
          builder: (context, appState, _) => HomePage(appState)),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) => const SignInPage(),
        ),
        GoRoute(
          path: 'sales',
          builder: (context, state) => SalesPage(),
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
    );
  }
}
