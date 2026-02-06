import 'package:json_annotation/json_annotation.dart'; // <--- THIS MUST BE HERE

part 'get_user_response_model.g.dart';

@JsonSerializable()
class GetUserResponseModel {
  @JsonKey(name: "status_code")
  final int? statusCode;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  GetUserResponseModel({
    this.statusCode,
    this.message,
    this.data,
  });

  GetUserResponseModel copyWith({
    int? statusCode,
    String? message,
    Data? data,
  }) =>
      GetUserResponseModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory GetUserResponseModel.fromJson(Map<String, dynamic> json) => _$GetUserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "access_token")
  final String? accessToken;
  @JsonKey(name: "refresh_token")
  final String? refreshToken;
  @JsonKey(name: "is_sign_in")
  final bool? isSignIn;

  Data({
    this.accessToken,
    this.refreshToken,
    this.isSignIn,
  });

  Data copyWith({
    String? accessToken,
    String? refreshToken,
    bool? isSignIn,
  }) =>
      Data(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        isSignIn: isSignIn ?? this.isSignIn,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
