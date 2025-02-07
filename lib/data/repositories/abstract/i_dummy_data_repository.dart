

 import 'package:herogram/data/models/dummy_data_model.dart';
import 'package:herogram/data/repositories/abstract/i_repository.dart';

abstract class IDummyDataRepository extends IRepository{
  IDummyDataRepository(super.httpClient, super.logger);

  Future<DummyDataModel>getDummyData();
}