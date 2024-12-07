import 'package:freezed_annotation/freezed_annotation.dart';
part 'token_response_model.freezed.dart';
part 'token_response_model.g.dart';

@Freezed()
class TokenResponseModel with _$TokenResponseModel{

  const factory TokenResponseModel({
     int? status,
     String? message,
    TokenModel? data
  }) = _TokenResponseModel;

  factory TokenResponseModel.fromJson(Map<String,dynamic> json) => _$TokenResponseModelFromJson(json);
}

@Freezed()
class TokenModel with _$TokenModel{

  const factory TokenModel({
    String? token,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String,dynamic> json) => _$TokenModelFromJson(json);
}