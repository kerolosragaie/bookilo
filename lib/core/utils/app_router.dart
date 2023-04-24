import 'package:bookilo/features/home/presentation/views/book_details_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

//?Routes names
const kSplashView = '/';
const kHomeView = '/homeView';
const kBookDetailsView = '/bookDetailsView';

abstract class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
