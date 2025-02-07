import 'package:herogram/core/utils/enums.dart';
import 'package:herogram/data/models/response_model.dart';

abstract class IHttpClient {
  IHttpClient();
  String userToken = '';

  Future<ResponseModel> sendRequest(
      {required final RequestMethod requestType,
      required final String url,
      required final Map<String, dynamic> parameters,
      final bool isFormData = false});

  void setToken(final String token) => userToken = token;
}
