import 'package:herogram/core/utils/enums.dart';
import 'package:herogram/data/models/dummy_data_model.dart';
import 'package:herogram/data/models/response_model.dart';
import 'package:herogram/third_parties_modules/abstract/i_internet_connection_module.dart';
import 'package:injectable/injectable.dart';
import 'package:herogram/data/clients/abstract/i_http_client.dart';
import 'package:herogram/data/errors/core_errors.dart';
import 'package:herogram/data/models/response_model.dart';


@Singleton(as: IHttpClient)
class HttpClient extends IHttpClient {
  final IInternetConnectionModule internetConnectionModule;

  HttpClient( this.internetConnectionModule);

  @override
  Future<ResponseModel> sendRequest(
      {required final RequestMethod requestType,
      required final String url,
      required final Map<String, dynamic> parameters,
      final bool isFormData = false}) async {
    if (!internetConnectionModule.hasInternetConnection) {
      throw InternetConnectionError();
    }
    try {
      await Future.delayed(Duration(seconds: 3));
      return ResponseModel(data: DummyDataModel.random().toJson());
    } on Exception {
      throw ServerError();
    }
  }

}
