import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_response_model.dart';

part 'users_response_model.freezed.dart';
part 'users_response_model.g.dart';

@Freezed()
class FetchUsersResponseModel with _$FetchUsersResponseModel{

  const factory FetchUsersResponseModel({
    int? status,
    String? message,
    List<UserDataModel>? data
  }) = _FetchUsersResponseModel;

  factory FetchUsersResponseModel.fromJson(Map<String,dynamic> json) => _$FetchUsersResponseModelFromJson(json);
}