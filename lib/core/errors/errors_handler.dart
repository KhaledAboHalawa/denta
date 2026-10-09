import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../di/dependency_injection.dart';
import '../l10n/app_localizations.dart';
import '../localization/locale_cubit.dart';

class Failure<T> {
  int statusCode;
  String message;
  bool success;
  int status;
  String? prettyMessage;

  Failure({
    required this.statusCode,
    required this.message,
    required this.success,
    required this.status,
    this.prettyMessage,
  });
}

class ApiInternalStatus {
  static const int success = 1;
  static const int failure = 0;
}

class ApiResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unAuth = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int apiLogicalError = 422;
  static const int internalServerError = 500;
  static const int connectTimeout = -1;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cancel = -2;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

enum ErrorType {
  noContent,
  badRequest,
  unAuth,
  forbidden,
  internalServerError,
  notFound,
  conflict,
  apiLogicError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

class ApiResponseMessage {
  static AppLocalizations get _currentL10n {
    if (getIt.isRegistered<LocaleCubit>()) {
      return lookupAppLocalizations(getIt<LocaleCubit>().state);
    }
    return lookupAppLocalizations(const Locale('en'));
  }

  static AppLocalizations of([BuildContext? context]) {
    if (context != null) {
      final l10n = AppLocalizations.of(context);
      if (l10n != null) return l10n;
    }
    return _currentL10n;
  }

  static String get noContentError => _currentL10n.noContentError;
  static String get badRequestError => _currentL10n.badRequestError;
  static String get unAuthenticationError =>
      _currentL10n.unAuthenticationError;
  static String get forbiddenError => _currentL10n.forbiddenError;
  static String get internalServerError =>
      _currentL10n.internalServerError;
  static String get notFoundError => _currentL10n.notFoundError;
  static String get conflictError => _currentL10n.conflictError;
  static String get apiLogicalError => _currentL10n.apiLogicalError;
  static String get connectTimeoutError => _currentL10n.connectTimeoutError;
  static String get cancelError => _currentL10n.cancelError;
  static String get receiveTimeoutError => _currentL10n.receiveTimeoutError;
  static String get sendTimeoutError => _currentL10n.sendTimeoutError;
  static String get cacheError => _currentL10n.cacheError;
  static String get noInternetConnectionError =>
      _currentL10n.noInternetConnectionError;
  static String get defaultError => _currentL10n.defaultError;
}

extension DataSourceExtension on ErrorType {
  Failure getFailure([BuildContext? context]) {
    final l10n = ApiResponseMessage.of(context);
    switch (this) {
      case ErrorType.noContent:
        return Failure(
          statusCode: ApiResponseCode.noContent,
          message: l10n.noContentError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.badRequest:
        return Failure(
          statusCode: ApiResponseCode.badRequest,
          message: l10n.badRequestError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.conflict:
        return Failure(
          statusCode: ApiResponseCode.conflict,
          message: l10n.conflictError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.forbidden:
        return Failure(
          statusCode: ApiResponseCode.forbidden,
          message: l10n.forbiddenError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.unAuth:
        return Failure(
          statusCode: ApiResponseCode.unAuth,
          status: ApiInternalStatus.failure,
          message: l10n.unAuthenticationError,
          success: false,
        );
      case ErrorType.notFound:
        return Failure(
          statusCode: ApiResponseCode.notFound,
          message: l10n.notFoundError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.internalServerError:
        return Failure(
          statusCode: ApiResponseCode.internalServerError,
          message: l10n.internalServerError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.connectTimeout:
        return Failure(
          statusCode: ApiResponseCode.connectTimeout,
          message: l10n.connectTimeoutError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.cancel:
        return Failure(
          statusCode: ApiResponseCode.cancel,
          message: l10n.cancelError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.receiveTimeout:
        return Failure(
          statusCode: ApiResponseCode.receiveTimeout,
          message: l10n.receiveTimeoutError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.sendTimeout:
        return Failure(
          statusCode: ApiResponseCode.sendTimeout,
          message: l10n.sendTimeoutError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.cacheError:
        return Failure(
          statusCode: ApiResponseCode.cacheError,
          message: l10n.cacheError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.noInternetConnection:
        return Failure(
          statusCode: ApiResponseCode.noInternetConnection,
          message: l10n.noInternetConnectionError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.defaultError:
        return Failure(
          statusCode: ApiResponseCode.defaultError,
          message: l10n.defaultError,
          status: ApiInternalStatus.failure,
          success: false,
        );
      case ErrorType.apiLogicError:
        return Failure(
          statusCode: ApiResponseCode.apiLogicalError,
          message: l10n.apiLogicalError,
          status: ApiInternalStatus.failure,
          success: false,
        );
    }
  }
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error, [BuildContext? context]) {
    if (error is DioException) {
      failure = _handleError(error, context);
    } else {
      failure = ErrorType.defaultError.getFailure(context);
    }
  }
}

Failure _handleError(DioException error, [BuildContext? context]) {
  final l10n = ApiResponseMessage.of(context);
  switch (error.type) {
    case DioExceptionType.transformTimeout:
      return ErrorType.sendTimeout.getFailure(context);
    case DioExceptionType.connectionTimeout:
      return ErrorType.connectTimeout.getFailure(context);
    case DioExceptionType.sendTimeout:
      return ErrorType.sendTimeout.getFailure(context);
    case DioExceptionType.receiveTimeout:
      return ErrorType.receiveTimeout.getFailure(context);
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.data != null) {
        String errorsMessage = "";
        dynamic jsonObject = error.response?.data;
        int? statusCode = error.response?.statusCode;
        if (jsonObject != null) {
          errorsMessage =
              jsonObject['error'] ?? l10n.badRequestError;
        }
        return Failure(
          statusCode:
              statusCode ??
              jsonObject['statusCode'] ??
              ApiResponseCode.badRequest,
          status: ApiInternalStatus.failure,
          message: jsonObject['error'] ?? l10n.badRequestError,
          success: false,
          prettyMessage: errorsMessage,
        );
      } else {
        return ErrorType.badRequest.getFailure(context);
      }
    case DioExceptionType.cancel:
      return ErrorType.cancel.getFailure(context);
    case DioExceptionType.unknown:
      return ErrorType.defaultError.getFailure(context);
    case DioExceptionType.connectionError:
      return ErrorType.defaultError.getFailure(context);
    case DioExceptionType.badCertificate:
      return ErrorType.defaultError.getFailure(context);
  }
}