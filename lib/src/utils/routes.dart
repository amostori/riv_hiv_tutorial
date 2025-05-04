import 'package:go_router/go_router.dart';
import 'package:riv_hiv_tutorial/src/features/home/presentation/home_screen.dart';
import 'package:riv_hiv_tutorial/src/utils/constants.dart';

enum AppRoutes { home }

final routes = GoRouter(
  initialLocation: AppPaths.homePath,
  routes: [
    GoRoute(
      path: AppPaths.homePath,
      builder: (context, state) => HomeScreen(),
      name: AppRoutes.home.name,
    ),
  ],
);
