

import 'package:herogram/core/controllers/object_data_loader.dart';
import 'package:herogram/core/utils/debouncer.dart';
import 'package:herogram/data/models/dummy_data_model.dart';
import 'package:herogram/data/repositories/abstract/i_dummy_data_repository.dart';
import 'package:injectable/injectable.dart';

/// a class handling home page data
@injectable
class MetricsController extends ObjectDataLoader<DummyDataModel>{
  final IDummyDataRepository dummyDataRepository;
  MetricsController(this.dummyDataRepository, super.logger, super.appRouter,super.snackBarShower);

  /// for refetshing purpeses
  Debouncer debouncer=Debouncer(duration: Duration(seconds: 3));

  @override
  Future<void> onInit() {
    debouncer.run(syncData);
    return super.onInit();
  }

  @override
  Future<DummyDataModel> dataGetter()=>dummyDataRepository.getDummyData();


  /// a function for refetch data after 5 seconds
  void syncData()=>runStoreSecondaryFunction(()async{

    /// if the data exsits on the screen
    if(error!=null)
      return;
    /// refresh
    data=await dummyDataRepository.getDummyData();

    /// redo fetching with debouncer
    debouncer.run(syncData);
      });
}