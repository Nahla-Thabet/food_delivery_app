// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel<Data> _$ResponseModelFromJson<Data>(
  Map<String, dynamic> json,
  Data Function(Object? json) fromJsonData,
) =>
    ResponseModel<Data>(
      status: json['status'] as int,
      data: fromJsonData(json['data']),
      errors: json['errors'],
      message: json['message'] as String,
    );

Map<String, dynamic> _$ResponseModelToJson<Data>(
  ResponseModel<Data> instance,
  Object? Function(Data value) toJsonData,
) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'data': toJsonData(instance.data),
    };
