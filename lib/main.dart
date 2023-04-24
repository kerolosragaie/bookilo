import 'package:flutter/material.dart';
import 'core/constants/app_theme.dart';
import 'core/utils/app_router.dart';

void main() {
  runApp(const Bookilo());
}

class Bookilo extends StatelessWidget {
  const Bookilo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      title: 'BOOKILO',
      theme: kAppTheme,
      routerConfig: AppRouter.router,
    );
  }
}
