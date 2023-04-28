import 'package:bookilo/core/utils/api_service.dart';
import 'package:bookilo/features/home/data/repository/home_repo_implementation.dart';
import 'package:bookilo/features/home/data/repository/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocater() async {
  //! Features - Characters, Eposides, ...
  //Repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(apiService: sl()));

  //Cubits
  /*sl.registerFactory(() => FeaturedBooksCubit(homeRepository: sl()));
  sl.registerFactory(() => NewestBooksCubit(homeRepository: sl()));*/

  //!core
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  //!External
  sl.registerLazySingleton<Dio>(() => Dio());
}
