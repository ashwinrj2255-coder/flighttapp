// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserResponseModel _$GetUserResponseModelFromJson(
  Map<String, dynamic> json,
) => GetUserResponseModel(
  statusCode: (json['status_code'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetUserResponseModelToJson(
  GetUserResponseModel instance,
) => <String, dynamic>{
  'status_code': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  accessToken: json['access_token'] as String?,
  refreshToken: json['refresh_token'] as String?,
  isSignIn: json['is_sign_in'] as bool?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'is_sign_in': instance.isSignIn,
};
