import 'dart:async';

import 'package:herogram/core/utils/enums.dart';
import 'package:herogram/data/clients/abstract/i_http_client.dart';
import 'package:herogram/data/errors/core_errors.dart';
import 'package:herogram/data/errors/custom_error.dart';
import 'package:herogram/data/models/response_model.dart';
import 'package:herogram/third_parties_modules/abstract/i_logger_module.dart';

abstract class IRepository {
  final IHttpClient httpClient;
  final ILoggerModule logger;
  IRepository(this.httpClient,  this.logger);

  Future<ResponseModel> _get(
          {required final String url,
          required final Map<String, dynamic> parameters}) =>
      httpClient.sendRequest(
          requestType: RequestMethod.get, url: url, parameters: parameters);
  Future<T> getObject<T>(
      {required final String url,
      required final T Function(Map<String, dynamic>) mapper,
      required final Map<String, dynamic> parameters}) async {
    try {
    final Map<String, dynamic> data =
        (await _get(url: url, parameters: parameters)).data;
      return mapper(data);
    } on CustomError catch (_) {
      rethrow;
    }
    catch(e){
      throw SomethingWentWrongError();
    }
  }

  Future<List<T>> getList<T>(
      {required final String url,
      required final T Function(Map<String, dynamic>) mapper,
      required final Map<String, dynamic> parameters}) async {
    try {
    final ResponseModel response = await _get(url: url, parameters: parameters);
      final List<dynamic> data=response.data;
      return data.map((final e)=>mapper(e)).toList();
    } catch (_) {

      throw SomethingWentWrongError();
    }
  }



  Future<T> post<T>(
      {required final String url,
      required final Map<String, dynamic> parameters,
      required final T Function(Map<String, dynamic>) mapper,
      final bool isFormData = false}) async {
    try {
    final ResponseModel response = await httpClient.sendRequest(
        requestType: RequestMethod.post,
        url: url,
        parameters: parameters,
        isFormData: isFormData);

      return mapper(response.data);
    } catch (_) {

      throw SomethingWentWrongError();
    }
  }

  Future<T> patch<T>(
      {required final String url,
      required final Map<String, dynamic> parameters,
      required final T Function(Map<String, dynamic>) mapper}) async {
    try {
    final ResponseModel response = await httpClient.sendRequest(
        requestType: RequestMethod.patch,
        url: url,
        parameters: parameters,
        isFormData: false);

      return mapper(response.data);
    } catch (_) {

      throw SomethingWentWrongError();
    }
  }

  Future<T> put<T>(
      {required final String url,
      required final Map<String, dynamic> parameters,
      required final T Function(Map<String, dynamic>) mapper}) async {
    try {
    final ResponseModel response = await httpClient.sendRequest(
        requestType: RequestMethod.put,
        url: url,
        parameters: parameters,
        isFormData: false);
      return mapper(response.data);
    } catch (_) {

      throw SomethingWentWrongError();
    }
  }

  Future<void> deleteMethod(
          {required final String url,
          final Map<String, dynamic>? parameters}) =>
      httpClient.sendRequest(
          requestType: RequestMethod.delete,
          url: url,
          parameters: parameters ?? {});
}
