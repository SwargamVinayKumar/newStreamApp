import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_request_model.freezed.dart';
part 'auth_request_model.g.dart';

@Freezed()
class SendOtpRequestModel with _$SendOtpRequestModel{

  const factory SendOtpRequestModel({
    required String mobile,
    required String? source
  }) = _SendOtpRequestModel;

  factory SendOtpRequestModel.fromJson(Map<String,dynamic> json) => _$SendOtpRequestModelFromJson(json);
}

@Freezed()
class VerifyOtpRequestModel with _$VerifyOtpRequestModel{

  const factory VerifyOtpRequestModel({
    required String mobile,
    required String otp
  }) = _VerifyOtpRequestModel;

  factory VerifyOtpRequestModel.fromJson(Map<String,dynamic> json) => _$VerifyOtpRequestModelFromJson(json);
}

@Freezed()
class RegisterUserRequestModel with _$RegisterUserRequestModel{

  const factory RegisterUserRequestModel({
    required String name,
  }) = _RegisterUserRequestModel;

  factory RegisterUserRequestModel.fromJson(Map<String,dynamic> json) => _$RegisterUserRequestModelFromJson(json);
}