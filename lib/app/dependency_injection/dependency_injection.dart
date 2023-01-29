import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data_source/remote_data_source/remote_data_source.dart';
import '../../data/network/network_info.dart';
import '../../data/repo_impl/repo_impl.dart';
import '../../domain/repo/repo.dart';
import '../../domain/use_cases/weather_by_city_use_case.dart';
import '../../domain/use_cases/weather_by_current_location.dart';
import '../../presentation/view_model/weather/weather_provider.dart';
import '../shared_pref/shared_pref.dart';

final getIt = GetIt.instance;

class DI {
  Future<void> setup() async {
    //Shared Pref init
    final prefs = await SharedPreferences.getInstance();

    // shared pref instance
    getIt.registerLazySingleton<SharedPreferences>(() => prefs);
    getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt()));

    // network info
    getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplement(
        InternetConnectionCheckerPlus(),
      ),
    );

    // Remote Data Source
    getIt.registerLazySingleton<BaseRemoteDataSource>(
      () => RemoteDataSource(),
    );

    // Repo
    getIt.registerLazySingleton<Repositories>(
      () => RepositoriesImplementation(getIt<BaseRemoteDataSource>()),
    );

    // Use Case
    getIt.registerLazySingleton<WeatherByCityUseCase>(
      () => WeatherByCityUseCase(
        getIt<Repositories>(),
      ),
    );
    getIt.registerLazySingleton<WeatherByCurrentLocationUseCase>(
      () => WeatherByCurrentLocationUseCase(
        getIt<Repositories>(),
      ),
    );

    // Provider
    getIt.registerFactory<WeatherProvider>(
      () => WeatherProvider(getIt<NetworkInfo>(), getIt<WeatherByCityUseCase>(),
          getIt<WeatherByCurrentLocationUseCase>()),
    );
  }
}
