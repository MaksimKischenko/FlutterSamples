import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:optimal_prime/domain/services/battery_info_service.dart';
import 'package:optimal_prime/domain/services/connectivity_service.dart';
import 'package:optimal_prime/utils/lifecycle_watcher.dart';

import 'domain/services/local_cache_service.dart';
import 'simple_bloc_observer.dart';

mixin AppInjector {
  // static const String baseURL = String.fromEnvironment('belarusbankApiUrl', defaultValue: 'http://192.168.253.178:5539');

  static Future<void> run() async {
    GetIt.instance
      ..registerLazySingleton<SimpleBlocObserver>(SimpleBlocObserver.new)
      ..registerLazySingleton<CacheService>(CacheService.new)
      ..registerLazySingleton<LifecycleWatcher>(LifecycleWatcher.new)
      ..registerLazySingleton<ConnectivityService>(
        () => ConnectivityService(
          connectivity: Connectivity(),
        ),
      )
      ..registerLazySingleton<BatteryInfoService>(
        () => BatteryInfoService(
          battery: Battery(),
        ),
      );

    //   final dio = Dio();
    //   dio.options.connectTimeout = const Duration(milliseconds: 10000);
    //   dio.options.receiveTimeout = const Duration(milliseconds: 25000);
    //   if (kDebugMode) {
    //     dio.interceptors.add(HttpFormatter());
    //   }

    //   getIt
    //   ..registerSingleton<Routes>(Routes())
    //   ..registerSingleton<DataManager>(
    //     DataManager()
    //   )
    //   ..registerSingleton<ChangePasswordRepositoryImpl>(
    //     ChangePasswordRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     changePasswordApi: ChangePasswordApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //   ..registerSingleton<TokenRepositoryImpl>(
    //     TokenRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     tokenApi: GetTokendApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<ArchivesRepositoryImpl>(
    //     ArchivesRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     archivesApi: ArchivesApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<ArchiveLocationsRepositoryImpl>(
    //     ArchiveLocationsRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     archiveLocationsApi: ArchiveLocationsApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<RuleAllocationDataRepositoryImpl>(
    //     RuleAllocationDataRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     ruleAllocationDataApi: RuleAllocationDataApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<DataSourcesRepositoryImpl>(
    //     DataSourcesRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     dataSourcesApi: DataSourcesApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<UsersRepositoryImpl>(
    //     UsersRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     usersApi: UsersApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<UserTypeRepositoryImpl>(
    //     UserTypeRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     userTypeApi: UserTypeApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<AuditLogRepositoryImpl>(
    //     AuditLogRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     auditLogApi: AuditLogApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<MapAllocationsRepositoryImpl>(
    //     MapAllocationsRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     mapAllocationsApi: MapAllocationsApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<ArchivePartsRepositoryImpl>(
    //     ArchivePartsRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     archivePartsApi: ArchivePartsApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<AvailableArchiveLocationRepositoryImpl>(
    //     AvailableArchiveLocationRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     availableArchiveLocationsApi: AvailableArchiveLocationsApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<ArchiveStatusRepositoryImpl>(
    //     ArchiveStatusRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     archiveStatusApi: ArchiveStatusApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<PaymentsRepositiryImpl>(
    //     PaymentsRepositiryImpl(
    //     dataManager: getIt<DataManager>(),
    //     paymentsApi: PaymentsApi(
    //       dio,
    //       baseUrl: baseURL
    //   )))
    //    ..registerSingleton<InfoReportsRepositoryImpl>(
    //     InfoReportsRepositoryImpl(
    //     dataManager: getIt<DataManager>(),
    //     infoReportsApi: InfoReportsApi(
    //       dio,
    //       baseUrl: baseURL
    //   )));
  }
}
