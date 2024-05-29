import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:injector/injector.dart';
import 'package:logger/logger.dart';

import 'screens_proj_test/postman/data/data_manager.dart';


class InjectionComponent {

  static final InjectionComponent _singleton = InjectionComponent._internal();
  // Use this static instance
  static final Injector injector = Injector.appInstance;

  factory InjectionComponent() => _singleton;

  InjectionComponent._internal();

  static Future<void> run() async {
    //Inject all
    injector
    ..registerSingleton<Dio>(() {
      final dio = Dio();
      dio.options.connectTimeout = 25000;
      dio.options.receiveTimeout = 25000;

      // inject debug dependency. перехватчики на запрос и на ответ и на ошибку
      if (kDebugMode) {
        final logger = Logger();
        // final alice =  Alice(showNotification: false, showInspectorOnShake: true, darkTheme: true)..setNavigatorKey(Navigation.navigatorKey);
        dio.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) {
            // logger.i(options.uri);
            logger
              ..i('REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}\nquery${options.queryParameters}}')
              ..i(options.data);
            return handler.next(options);
          },
          onResponse: (response, handler) {
            logger.i(response.data);
            // print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}${response.requestOptions.path}');
            return handler.next(response);
          },
          onError: (e, handler) {
            logger
              ..e('${e.message}\n\n${e.response?.data}')
              ..e(e.response?.data);
            // print('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}${e.requestOptions.path}');
            return handler.next(e);
          }
        ));

        // dio.interceptors.add(alice.getDioInterceptor());
      }

      return dio;
    })
    // ignore: prefer_expression_function_bodies
    ..registerSingleton<DataManager>(() {
      return DataManager(injector.get<Dio>());
      // return RealDataManager(injector.get<Dio>());
      // return FakeDataManager(injector.get<Dio>());
    });
    // ..registerSingleton<PreferencesHelper>(() => PreferencesHelper());
  }

  static T getDependency<T>() => injector.get<T>();
  
}