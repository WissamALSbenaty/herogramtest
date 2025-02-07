import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dummy_data_model.g.dart';

@JsonSerializable()
class DummyDataModel{

  final int totalSales;
  final int activeUsers;
  final double conversionRate;


  DummyDataModel({required this.totalSales, required this.activeUsers, required this.conversionRate});

  factory DummyDataModel.random() {
    Random random = Random();
    return DummyDataModel(
      totalSales: random.nextInt(100),
      activeUsers: random.nextInt(100),
      conversionRate: random.nextDouble()*100);
  }factory DummyDataModel.fromJson(final Map<String, dynamic> json) =>
      _$DummyDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DummyDataModelToJson(this);
}