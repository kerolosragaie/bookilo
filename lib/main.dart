import 'package:bookilo/core/utils/service_locater.dart' as di;
import 'package:bookilo/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookilo/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_theme.dart';
import 'core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupServiceLocater();
  runApp(const Bookilo());
}

class Bookilo extends StatelessWidget {
  const Bookilo({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => FeaturedBooksCubit(homeRepository: di.sl())
              ..fetchFeaturedBooks()),
        BlocProvider(
            create: (_) =>
                NewestBooksCubit(homeRepository: di.sl())..fetchNewestBooks()),
      ],
      child: MaterialApp.router(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        title: 'BOOKILO',
        theme: kAppTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
