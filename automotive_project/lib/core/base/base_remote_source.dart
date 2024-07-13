import 'package:automotive_project/network/dio_provider.dart';
import 'package:automotive_project/network/error_handlers.dart';
import 'package:automotive_project/network/exceptions/base_exception.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  // final logger = BuildConfig.instance.config.logger;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      return response;
    } on DioException catch (dioError) {
      Exception exception = handleDioError(dioError);
      throw exception;
    } catch (error) {
      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
