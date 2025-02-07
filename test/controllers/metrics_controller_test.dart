


import 'package:flutter_test/flutter_test.dart';
import 'package:herogram/core/presentation/router/auto_router.dart';
import 'package:herogram/core/presentation/snake_bars/bottom_snack_bar.dart';
import 'package:herogram/data/errors/core_errors.dart';
import 'package:herogram/data/models/dummy_data_model.dart';
import 'package:herogram/data/repositories/abstract/i_dummy_data_repository.dart';
import 'package:herogram/features/home/controllers/metrics_controller.dart';
import 'package:herogram/third_parties_modules/concrete/logger_module.dart';
import 'package:mocktail/mocktail.dart';
import '../mocks/repositories.dart';
import '../mocks/utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final LoggerModule logger = LoggerModule();
  final AppRouter appRouter=MockAppRouter();
  final SnakeBarShower snackBarShower=MockSnackBarShower();
  final IDummyDataRepository dummyDataRepository = MockDummyDataRepository();
  late MetricsController metricController;

  setUpAll(() {
   // registerFallbackValue(LoginDto(email: 'email', password:'password'));
  });
  setUp(() {
    metricController = MetricsController( dummyDataRepository, logger,appRouter,snackBarShower);
  });

  test('Should get data successfully', ()async{
    when( ()=>dummyDataRepository.getDummyData()).thenAnswer((final _) async{
      return DummyDataModel(totalSales: 1, activeUsers: 2, conversionRate: 3);
    });

    await metricController.loadData();
    verify( ()=>dummyDataRepository.getDummyData()).called(1);
    expect(metricController.data?.totalSales, 1);
    expect(metricController.data?.activeUsers, 2);
    expect(metricController.data?.conversionRate, 3);
  });

  test('Failed to load data', () async {
    when(() => dummyDataRepository.getDummyData()).thenThrow(InternetConnectionError());

    await metricController.loadData();
    verify( ()=>dummyDataRepository.getDummyData()).called(1);
    expect(metricController.data , isNull);
    expect(metricController.error, isA<InternetConnectionError>());

  });


  test('retry after failing', () async {
    when(() => dummyDataRepository.getDummyData()).thenThrow(InternetConnectionError());

    await metricController.loadData();
    verify( ()=>dummyDataRepository.getDummyData()).called(1);
    expect(metricController.data , isNull);
    expect(metricController.error, isA<InternetConnectionError>());

    when( ()=>dummyDataRepository.getDummyData()).thenAnswer((final _) async{
      return DummyDataModel(totalSales: 1, activeUsers: 2, conversionRate: 3);
    });

    await metricController.loadData();
    verify( ()=>dummyDataRepository.getDummyData()).called(1);
    expect(metricController.data?.totalSales, 1);
    expect(metricController.data?.activeUsers, 2);
    expect(metricController.data?.conversionRate, 3);
  });
}