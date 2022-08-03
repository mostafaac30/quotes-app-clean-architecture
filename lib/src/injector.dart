import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quote_app_clean_architecture/src/config/app_prefs.dart';
import 'package:quote_app_clean_architecture/src/core/network/dio_factory.dart';
import 'package:quote_app_clean_architecture/src/core/network/network_info.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/data/datasources/random_quote_romote_datasource.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/data/datasources/random_qutoe_local_datasource.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quote_app_clean_architecture/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
  ///features
//blocs
  sl.registerFactory<RandomQuoteCubit>(
      () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  //registerFactory ? create a new instance once it called.
  // if a cubit closed on a screen, Not affect other screens

  sl.registerLazySingleton<GetRandomQuote>(
      () => GetRandomQuote(quoteRepository: sl()));

  // repositories

  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl()));

// data sources
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(dioFactory: sl()));

  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));

  ///core
  sl.registerLazySingleton<DioFactory>(() => DioFactory(appPreferences: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => InternetInfoImp(internetConnectionChecker: sl()));

  ///external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppPreferences(sharedPreferences));
}
