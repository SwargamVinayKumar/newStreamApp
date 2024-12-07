import 'package:freezed_annotation/freezed_annotation.dart';
part 'token_request_model.freezed.dart';
part 'token_request_model.g.dart';

@Freezed()
class TokenRequestModel with _$TokenRequestModel{

  const factory TokenRequestModel({
    required String name,
  }) = _TokenRequestModel;

  factory TokenRequestModel.fromJson(Map<String,dynamic> json) => _$TokenRequestModelFromJson(json);
}