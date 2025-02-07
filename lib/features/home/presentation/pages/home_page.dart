import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herogram/core/presentation/widgets/custom_sized_box.dart';
import 'package:herogram/core/presentation/widgets/object_data_loader_widget.dart';
import 'package:herogram/dependencies.dart';
import 'package:herogram/features/home/controllers/metrics_controller.dart';
import 'package:herogram/features/home/presentation/widgets/metric_tile.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MetricsController controller=getIt<MetricsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: ObjectDataLoaderWidget(dataLoader: controller,
          childBuilder: (data)=>RefreshIndicator(
              onRefresh: controller.loadData,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  MetricTile(metricName: 'Total Sales',metricValue:data.totalSales,),
                  CustomSizedBox(height: 8,),
                  MetricTile(metricName: 'Active Users',metricValue:data.activeUsers,),
                  CustomSizedBox(height: 8,),
                  MetricTile(metricName: 'Conversion Rate',metricValue:'%${data.conversionRate.floor()}',),
                ],
              ),
          ))
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
