import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@Freezed()
class PrimeryResponseModel with _$PrimeryResponseModel{

  const factory PrimeryResponseModel({
    int? status,
    String? message,
  }) = _PrimeryResponseModel;

  factory PrimeryResponseModel.fromJson(Map<String,dynamic> json) => _$PrimeryResponseModelFromJson(json);
}

@Freezed()
class VerifyOtpResponseModel with _$VerifyOtpResponseModel{

  const factory VerifyOtpResponseModel({
    int? status,
    String? message,
    TokenDataModel? data
  }) = _VerifyOtpResponseModel;

  factory VerifyOtpResponseModel.fromJson(Map<String,dynamic> json) => _$VerifyOtpResponseModelFromJson(json);
}


@Freezed()
class RegisterUserResponseModel with _$RegisterUserResponseModel{

  const factory RegisterUserResponseModel({
    int? status,
    String? message,
    UserDataModel? data
  }) = _RegisterUserResponseModel;

  factory RegisterUserResponseModel.fromJson(Map<String,dynamic> json) => _$RegisterUserResponseModelFromJson(json);
}

@Freezed()
class UserDataModel with _$UserDataModel{
  const factory UserDataModel({
    String? name,
    String? token,
    int? mobile
  }) = _UserDataModel;
  factory UserDataModel.fromJson(Map<String,dynamic> json) => _$UserDataModelFromJson(json);
}

@Freezed()
class TokenDataModel with _$TokenDataModel{

  const factory TokenDataModel({
    String? token,
    String? jwtToken,
    String? userName,
    bool? registerUser
  }) = _TokenDataModel;

  factory TokenDataModel.fromJson(Map<String,dynamic> json) => _$TokenDataModelFromJson(json);
}