// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/presentation/router/auto_router.dart' as _i658;
import 'core/presentation/snake_bars/bottom_snack_bar.dart' as _i573;
import 'data/clients/abstract/i_http_client.dart' as _i768;
import 'data/clients/concrete/http_client.dart' as _i1015;
import 'data/repositories/abstract/i_dummy_data_repository.dart' as _i937;
import 'data/repositories/concrete/dummy_data_repository.dart' as _i831;
import 'features/home/controllers/metrics_controller.dart' as _i71;
import 'third_parties_modules/abstract/i_internet_connection_module.dart'
    as _i103;
import 'third_parties_modules/abstract/i_logger_module.dart' as _i1037;
import 'third_parties_modules/concrete/internet_connection_module.dart'
    as _i235;
import 'third_parties_modules/concrete/logger_module.dart' as _i728;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appRouterModule = _$AppRouterModule();
  final connectivityPackage = _$ConnectivityPackage();
  gh.singleton<_i658.AppRouter>(() => appRouterModule.getAppRouter);
  gh.singleton<_i573.SnakeBarShower>(() => _i573.SnakeBarShower());
  gh.singleton<_i895.Connectivity>(() => connectivityPackage.connectivity);
  gh.singleton<_i1037.ILoggerModule>(() => _i728.LoggerModule());
  gh.singleton<_i103.IInternetConnectionModule>(
    () => _i235.InternetConnectionModule(gh<_i895.Connectivity>()),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i768.IHttpClient>(
      () => _i1015.HttpClient(gh<_i103.IInternetConnectionModule>()));
  gh.singleton<_i937.IDummyDataRepository>(() => _i831.DummyDataRepository(
        gh<_i768.IHttpClient>(),
        gh<_i1037.ILoggerModule>(),
      ));
  gh.factory<_i71.MetricsController>(() => _i71.MetricsController(
        gh<_i937.IDummyDataRepository>(),
        gh<_i1037.ILoggerModule>(),
        gh<_i658.AppRouter>(),
        gh<_i573.SnakeBarShower>(),
      ));
  return getIt;
}

class _$AppRouterModule extends _i658.AppRouterModule {}

class _$ConnectivityPackage extends _i235.ConnectivityPackage {
  @override
  _i895.Connectivity get connectivity => _i895.Connectivity();
}
