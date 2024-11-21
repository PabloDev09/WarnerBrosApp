import 'package:go_router/go_router.dart';
import 'package:warnerapp/screens/loading_screen.dart';
import 'package:warnerapp/screens/warner_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const WarnerScreen(),
    ),
  ],
);
