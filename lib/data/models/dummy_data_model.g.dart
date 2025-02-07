// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyDataModel _$DummyDataModelFromJson(Map<String, dynamic> json) =>
    DummyDataModel(
      totalSales: (json['totalSales'] as num).toInt(),
      activeUsers: (json['activeUsers'] as num).toInt(),
      conversionRate: (json['conversionRate'] as num).toDouble(),
    );

Map<String, dynamic> _$DummyDataModelToJson(DummyDataModel instance) =>
    <String, dynamic>{
      'totalSales': instance.totalSales,
      'activeUsers': instance.activeUsers,
      'conversionRate': instance.conversionRate,
    };
