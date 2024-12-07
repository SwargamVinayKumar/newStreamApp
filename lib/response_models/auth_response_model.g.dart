// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrimeryResponseModelImpl _$$PrimeryResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PrimeryResponseModelImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$PrimeryResponseModelImplToJson(
        _$PrimeryResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

_$VerifyOtpResponseModelImpl _$$VerifyOtpResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyOtpResponseModelImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : TokenDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VerifyOtpResponseModelImplToJson(
        _$VerifyOtpResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$RegisterUserResponseModelImpl _$$RegisterUserResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterUserResponseModelImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RegisterUserResponseModelImplToJson(
        _$RegisterUserResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$UserDataModelImpl _$$UserDataModelImplFromJson(Map<String, dynamic> json) =>
    _$UserDataModelImpl(
      name: json['name'] as String?,
      token: json['token'] as String?,
      mobile: (json['mobile'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserDataModelImplToJson(_$UserDataModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'token': instance.token,
      'mobile': instance.mobile,
    };

_$TokenDataModelImpl _$$TokenDataModelImplFromJson(Map<String, dynamic> json) =>
    _$TokenDataModelImpl(
      token: json['token'] as String?,
      jwtToken: json['jwtToken'] as String?,
      userName: json['userName'] as String?,
      registerUser: json['registerUser'] as bool?,
    );

Map<String, dynamic> _$$TokenDataModelImplToJson(
        _$TokenDataModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'jwtToken': instance.jwtToken,
      'userName': instance.userName,
      'registerUser': instance.registerUser,
    };
