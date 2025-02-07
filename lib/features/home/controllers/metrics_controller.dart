

import 'package:herogram/core/controllers/object_data_loader.dart';
import 'package:herogram/core/utils/debouncer.dart';
import 'package:herogram/data/models/dummy_data_model.dart';
import 'package:herogram/data/repositories/abstract/i_dummy_data_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MetricsController extends ObjectDataLoader<DummyDataModel>{
  final IDummyDataRepository dummyDataRepository;
  MetricsController(this.dummyDataRepository, super.logger, super.appRouter,super.snackBarShower);
  Debouncer debouncer=Debouncer(duration: Duration(seconds: 5));

  @override
  Future<void> onInit() {
    debouncer.run(syncData);
    return super.onInit();
  }

  @override
  Future<DummyDataModel> dataGetter()=>dummyDataRepository.getDummyData();

  void syncData()=>runStoreSecondaryFunction(()async{
    if(error!=null)
      return;
    data=await dummyDataRepository.getDummyData();
    debouncer.run(syncData);
      });
}