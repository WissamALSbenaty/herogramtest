


import 'package:herogram/data/models/dummy_data_model.dart';
import 'package:herogram/data/repositories/abstract/i_dummy_data_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: IDummyDataRepository)
class DummyDataRepository extends IDummyDataRepository{
  DummyDataRepository(super.httpClient, super.logger);

  @override
  Future<DummyDataModel> getDummyData()=>getObject(url: 'DummyUrl',
      mapper: DummyDataModel.fromJson, parameters: {});
  
}