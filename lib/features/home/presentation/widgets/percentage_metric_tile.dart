import 'package:flutter/material.dart';
import 'package:herogram/core/presentation/app_style.dart';
import 'package:herogram/core/presentation/arguments/metric_details_page_arguments.dart';
import 'package:herogram/core/presentation/router/auto_router.dart';
import 'package:herogram/core/presentation/widgets/custom_animated_text.dart';
import 'package:herogram/features/home/presentation/widgets/arc_widget.dart';

class PercentageMetricTile extends StatelessWidget {
  final String metricName;
  final double metricValue;
  const PercentageMetricTile({Key? key, required this.metricName,required this.metricValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ()=>getAppRouter.push(MetricDetailsRoute(args: MetricDetailsPageArguments(metricName: metricName,
          metricValue: metricValue))),
      tileColor: AppStyle.lightPink,
      leading: ArcWidget(percentage: metricValue),
      title:  Hero(
        tag: metricName,
        child:
        Material(
            color: Colors.transparent,
            child: Text(metricName,style: AppStyle.textTheme.bodyLarge)),
      ),
      trailing: Hero(
          tag: metricValue.toString(),
          child: Material(
              type: MaterialType.transparency,
              child: CustomAnimatedText('%${metricValue.floor().toString()}',style: AppStyle.textTheme.bodyMedium))),
    );
  }
}
