import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:herogram/core/presentation/app_style.dart';
import 'package:herogram/core/presentation/arguments/metric_details_page_arguments.dart';
import 'package:herogram/core/presentation/widgets/custom_sized_box.dart';

@RoutePage()
class MetricDetailsPage extends StatelessWidget {
  final MetricDetailsPageArguments args;
  const MetricDetailsPage({Key? key,required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: args.metricName,
                child: Material(
                    type: MaterialType.transparency,
                    child: Text(args.metricName,style: AppStyle.textTheme.headlineMedium!,))),
            CustomSizedBox(height: 24,),
            Hero(
              tag: args.metricValue.toString(),
                child: Material(
                    type: MaterialType.transparency,
                    child: Text(args.metricValue.toString(),style: AppStyle.textTheme.headlineMedium!,))),

          ],
        ),
      )
    );
  }
}
