import 'package:data_management/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'index.dart';
import 'utils/custom_dio_error.dart';

GetIt di = GetIt.instance;

Future<void> diInit() async {
  await _base();
  await _registerDio();
  _user();
  await di.allReady();
}

Future<void> _base() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => preferences);
  di.registerLazySingleton<UserPreference>(() => UserPreference(di()));
}

var loggingOutProgress = false;

Future<void> _registerDio() async {
  var user = await AuthUtils.authorizer();
  di.registerLazySingleton<BaseOptions>(
    () => BaseOptions(
      baseUrl: "${ApiInfo.baseUrl}/",
      responseType: ResponseType.plain,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      validateStatus: (status) => status! < 500,
      headers: {'Authorization': "Bearer ${user.accessToken}"},
    ),
  );
  di.registerLazySingleton<Dio>(
    () => Dio(di())
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            handler.next(options);
          },
          onResponse: (response, handler) async {
            final curData = response.data;
            // final curData =
            // await AppEncryptionUtilities.getJsonFromApiData(response.data);
            if (curData.contains('Token not found') ||
                curData.contains('No token in DB') ||
                curData.contains('token is expired')) {
              if (!loggingOutProgress) {
                loggingOutProgress = true;
                //final response = await CommonReceiveUseCase.parseCommonResponse(curData);
                // if (AppAlertDialog.logoutDialogIsOpen) {
                //   AppUtilities.popTopWidget();
                //   AppAlertDialog.logoutDialogIsOpen = false;
                // }
                // AppAlertDialog.textShowAlertDialogFromNavContext(
                //   title: LocaleKeys.sessionTimeOut.tr(),
                //   bodyMessage: LocaleKeys.sessionExpired.tr(),
                //   //title: response.result!.status.toString(),
                //   //bodyMessage: response.result!.errMsg,
                // );
                //await Future.delayed(const Duration(milliseconds: 2500));
                // AppSnackBar.showFailureSnackBar(
                //   context: AppUtilities.curNavigationContext!,
                //   message:
                //   'Session expired due to inactivity, Please login again!',
                // );
                await Future.delayed(const Duration(milliseconds: 1500));
                //AppUtilities.forceLogoutFromApplication();
                loggingOutProgress = false;
              }
            } else {
              handler.next(Response(
                requestOptions: response.requestOptions,
                redirects: response.redirects,
                isRedirect: response.isRedirect,
                statusCode: response.statusCode,
                statusMessage: response.statusMessage,
                extra: response.extra,
                headers: response.headers,
                //data: await AppEncryptionUtilities.getJsonFromApiData(response.data),
                data: curData,
              ));
            }
          },
          onError: (error, handler) {
            final customDioError = CustomDioError(
              requestOptions: error.requestOptions,
              error: error.error,
              message: error.message,
              response: error.response,
              stackTrace: error.stackTrace,
              type: error.type,
            );
            handler.next(customDioError);
          },
        ),
      ),
  );
}

void _user() {
  di.registerLazySingleton<UserDataSource>(() {
    return UserDataSource();
  });

  di.registerLazySingleton<RemoteDataRepository<User>>(() {
    return RemoteDataRepositoryImpl<User>(source: di<UserDataSource>());
  });

  di.registerLazySingleton<RemoteDataHandler<User>>(() {
    return RemoteDataHandlerImpl<User>(repository: di());
  });

  di.registerFactory<UserController>(() => UserController(di()));
}
