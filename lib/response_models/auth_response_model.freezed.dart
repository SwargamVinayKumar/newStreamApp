// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrimeryResponseModel _$PrimeryResponseModelFromJson(Map<String, dynamic> json) {
  return _PrimeryResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PrimeryResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this PrimeryResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrimeryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrimeryResponseModelCopyWith<PrimeryResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrimeryResponseModelCopyWith<$Res> {
  factory $PrimeryResponseModelCopyWith(PrimeryResponseModel value,
          $Res Function(PrimeryResponseModel) then) =
      _$PrimeryResponseModelCopyWithImpl<$Res, PrimeryResponseModel>;
  @useResult
  $Res call({int? status, String? message});
}

/// @nodoc
class _$PrimeryResponseModelCopyWithImpl<$Res,
        $Val extends PrimeryResponseModel>
    implements $PrimeryResponseModelCopyWith<$Res> {
  _$PrimeryResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrimeryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrimeryResponseModelImplCopyWith<$Res>
    implements $PrimeryResponseModelCopyWith<$Res> {
  factory _$$PrimeryResponseModelImplCopyWith(_$PrimeryResponseModelImpl value,
          $Res Function(_$PrimeryResponseModelImpl) then) =
      __$$PrimeryResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message});
}

/// @nodoc
class __$$PrimeryResponseModelImplCopyWithImpl<$Res>
    extends _$PrimeryResponseModelCopyWithImpl<$Res, _$PrimeryResponseModelImpl>
    implements _$$PrimeryResponseModelImplCopyWith<$Res> {
  __$$PrimeryResponseModelImplCopyWithImpl(_$PrimeryResponseModelImpl _value,
      $Res Function(_$PrimeryResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrimeryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$PrimeryResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrimeryResponseModelImpl implements _PrimeryResponseModel {
  const _$PrimeryResponseModelImpl({this.status, this.message});

  factory _$PrimeryResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrimeryResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'PrimeryResponseModel(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrimeryResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  /// Create a copy of PrimeryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrimeryResponseModelImplCopyWith<_$PrimeryResponseModelImpl>
      get copyWith =>
          __$$PrimeryResponseModelImplCopyWithImpl<_$PrimeryResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrimeryResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PrimeryResponseModel implements PrimeryResponseModel {
  const factory _PrimeryResponseModel(
      {final int? status, final String? message}) = _$PrimeryResponseModelImpl;

  factory _PrimeryResponseModel.fromJson(Map<String, dynamic> json) =
      _$PrimeryResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;

  /// Create a copy of PrimeryResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrimeryResponseModelImplCopyWith<_$PrimeryResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VerifyOtpResponseModel _$VerifyOtpResponseModelFromJson(
    Map<String, dynamic> json) {
  return _VerifyOtpResponseModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  TokenDataModel? get data => throw _privateConstructorUsedError;

  /// Serializes this VerifyOtpResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOtpResponseModelCopyWith<VerifyOtpResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpResponseModelCopyWith<$Res> {
  factory $VerifyOtpResponseModelCopyWith(VerifyOtpResponseModel value,
          $Res Function(VerifyOtpResponseModel) then) =
      _$VerifyOtpResponseModelCopyWithImpl<$Res, VerifyOtpResponseModel>;
  @useResult
  $Res call({int? status, String? message, TokenDataModel? data});

  $TokenDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$VerifyOtpResponseModelCopyWithImpl<$Res,
        $Val extends VerifyOtpResponseModel>
    implements $VerifyOtpResponseModelCopyWith<$Res> {
  _$VerifyOtpResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TokenDataModel?,
    ) as $Val);
  }

  /// Create a copy of VerifyOtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TokenDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifyOtpResponseModelImplCopyWith<$Res>
    implements $VerifyOtpResponseModelCopyWith<$Res> {
  factory _$$VerifyOtpResponseModelImplCopyWith(
          _$VerifyOtpResponseModelImpl value,
          $Res Function(_$VerifyOtpResponseModelImpl) then) =
      __$$VerifyOtpResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, TokenDataModel? data});

  @override
  $TokenDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$VerifyOtpResponseModelImplCopyWithImpl<$Res>
    extends _$VerifyOtpResponseModelCopyWithImpl<$Res,
        _$VerifyOtpResponseModelImpl>
    implements _$$VerifyOtpResponseModelImplCopyWith<$Res> {
  __$$VerifyOtpResponseModelImplCopyWithImpl(
      _$VerifyOtpResponseModelImpl _value,
      $Res Function(_$VerifyOtpResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$VerifyOtpResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TokenDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpResponseModelImpl implements _VerifyOtpResponseModel {
  const _$VerifyOtpResponseModelImpl({this.status, this.message, this.data});

  factory _$VerifyOtpResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final TokenDataModel? data;

  @override
  String toString() {
    return 'VerifyOtpResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of VerifyOtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpResponseModelImplCopyWith<_$VerifyOtpResponseModelImpl>
      get copyWith => __$$VerifyOtpResponseModelImplCopyWithImpl<
          _$VerifyOtpResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpResponseModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpResponseModel implements VerifyOtpResponseModel {
  const factory _VerifyOtpResponseModel(
      {final int? status,
      final String? message,
      final TokenDataModel? data}) = _$VerifyOtpResponseModelImpl;

  factory _VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  TokenDataModel? get data;

  /// Create a copy of VerifyOtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpResponseModelImplCopyWith<_$VerifyOtpResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RegisterUserResponseModel _$RegisterUserResponseModelFromJson(
    Map<String, dynamic> json) {
  return _RegisterUserResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterUserResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UserDataModel? get data => throw _privateConstructorUsedError;

  /// Serializes this RegisterUserResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterUserResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterUserResponseModelCopyWith<RegisterUserResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserResponseModelCopyWith<$Res> {
  factory $RegisterUserResponseModelCopyWith(RegisterUserResponseModel value,
          $Res Function(RegisterUserResponseModel) then) =
      _$RegisterUserResponseModelCopyWithImpl<$Res, RegisterUserResponseModel>;
  @useResult
  $Res call({int? status, String? message, UserDataModel? data});

  $UserDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$RegisterUserResponseModelCopyWithImpl<$Res,
        $Val extends RegisterUserResponseModel>
    implements $RegisterUserResponseModelCopyWith<$Res> {
  _$RegisterUserResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterUserResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDataModel?,
    ) as $Val);
  }

  /// Create a copy of RegisterUserResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterUserResponseModelImplCopyWith<$Res>
    implements $RegisterUserResponseModelCopyWith<$Res> {
  factory _$$RegisterUserResponseModelImplCopyWith(
          _$RegisterUserResponseModelImpl value,
          $Res Function(_$RegisterUserResponseModelImpl) then) =
      __$$RegisterUserResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, UserDataModel? data});

  @override
  $UserDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$RegisterUserResponseModelImplCopyWithImpl<$Res>
    extends _$RegisterUserResponseModelCopyWithImpl<$Res,
        _$RegisterUserResponseModelImpl>
    implements _$$RegisterUserResponseModelImplCopyWith<$Res> {
  __$$RegisterUserResponseModelImplCopyWithImpl(
      _$RegisterUserResponseModelImpl _value,
      $Res Function(_$RegisterUserResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterUserResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$RegisterUserResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterUserResponseModelImpl implements _RegisterUserResponseModel {
  const _$RegisterUserResponseModelImpl({this.status, this.message, this.data});

  factory _$RegisterUserResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterUserResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final UserDataModel? data;

  @override
  String toString() {
    return 'RegisterUserResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of RegisterUserResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserResponseModelImplCopyWith<_$RegisterUserResponseModelImpl>
      get copyWith => __$$RegisterUserResponseModelImplCopyWithImpl<
          _$RegisterUserResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterUserResponseModelImplToJson(
      this,
    );
  }
}

abstract class _RegisterUserResponseModel implements RegisterUserResponseModel {
  const factory _RegisterUserResponseModel(
      {final int? status,
      final String? message,
      final UserDataModel? data}) = _$RegisterUserResponseModelImpl;

  factory _RegisterUserResponseModel.fromJson(Map<String, dynamic> json) =
      _$RegisterUserResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  UserDataModel? get data;

  /// Create a copy of RegisterUserResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterUserResponseModelImplCopyWith<_$RegisterUserResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) {
  return _UserDataModel.fromJson(json);
}

/// @nodoc
mixin _$UserDataModel {
  String? get name => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  int? get mobile => throw _privateConstructorUsedError;

  /// Serializes this UserDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataModelCopyWith<UserDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataModelCopyWith<$Res> {
  factory $UserDataModelCopyWith(
          UserDataModel value, $Res Function(UserDataModel) then) =
      _$UserDataModelCopyWithImpl<$Res, UserDataModel>;
  @useResult
  $Res call({String? name, String? token, int? mobile});
}

/// @nodoc
class _$UserDataModelCopyWithImpl<$Res, $Val extends UserDataModel>
    implements $UserDataModelCopyWith<$Res> {
  _$UserDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? token = freezed,
    Object? mobile = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataModelImplCopyWith<$Res>
    implements $UserDataModelCopyWith<$Res> {
  factory _$$UserDataModelImplCopyWith(
          _$UserDataModelImpl value, $Res Function(_$UserDataModelImpl) then) =
      __$$UserDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? token, int? mobile});
}

/// @nodoc
class __$$UserDataModelImplCopyWithImpl<$Res>
    extends _$UserDataModelCopyWithImpl<$Res, _$UserDataModelImpl>
    implements _$$UserDataModelImplCopyWith<$Res> {
  __$$UserDataModelImplCopyWithImpl(
      _$UserDataModelImpl _value, $Res Function(_$UserDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? token = freezed,
    Object? mobile = freezed,
  }) {
    return _then(_$UserDataModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataModelImpl implements _UserDataModel {
  const _$UserDataModelImpl({this.name, this.token, this.mobile});

  factory _$UserDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? token;
  @override
  final int? mobile;

  @override
  String toString() {
    return 'UserDataModel(name: $name, token: $token, mobile: $mobile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.mobile, mobile) || other.mobile == mobile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, token, mobile);

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataModelImplCopyWith<_$UserDataModelImpl> get copyWith =>
      __$$UserDataModelImplCopyWithImpl<_$UserDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataModelImplToJson(
      this,
    );
  }
}

abstract class _UserDataModel implements UserDataModel {
  const factory _UserDataModel(
      {final String? name,
      final String? token,
      final int? mobile}) = _$UserDataModelImpl;

  factory _UserDataModel.fromJson(Map<String, dynamic> json) =
      _$UserDataModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get token;
  @override
  int? get mobile;

  /// Create a copy of UserDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataModelImplCopyWith<_$UserDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenDataModel _$TokenDataModelFromJson(Map<String, dynamic> json) {
  return _TokenDataModel.fromJson(json);
}

/// @nodoc
mixin _$TokenDataModel {
  String? get token => throw _privateConstructorUsedError;
  String? get jwtToken => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  bool? get registerUser => throw _privateConstructorUsedError;

  /// Serializes this TokenDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenDataModelCopyWith<TokenDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenDataModelCopyWith<$Res> {
  factory $TokenDataModelCopyWith(
          TokenDataModel value, $Res Function(TokenDataModel) then) =
      _$TokenDataModelCopyWithImpl<$Res, TokenDataModel>;
  @useResult
  $Res call(
      {String? token, String? jwtToken, String? userName, bool? registerUser});
}

/// @nodoc
class _$TokenDataModelCopyWithImpl<$Res, $Val extends TokenDataModel>
    implements $TokenDataModelCopyWith<$Res> {
  _$TokenDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? jwtToken = freezed,
    Object? userName = freezed,
    Object? registerUser = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      jwtToken: freezed == jwtToken
          ? _value.jwtToken
          : jwtToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      registerUser: freezed == registerUser
          ? _value.registerUser
          : registerUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenDataModelImplCopyWith<$Res>
    implements $TokenDataModelCopyWith<$Res> {
  factory _$$TokenDataModelImplCopyWith(_$TokenDataModelImpl value,
          $Res Function(_$TokenDataModelImpl) then) =
      __$$TokenDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? token, String? jwtToken, String? userName, bool? registerUser});
}

/// @nodoc
class __$$TokenDataModelImplCopyWithImpl<$Res>
    extends _$TokenDataModelCopyWithImpl<$Res, _$TokenDataModelImpl>
    implements _$$TokenDataModelImplCopyWith<$Res> {
  __$$TokenDataModelImplCopyWithImpl(
      _$TokenDataModelImpl _value, $Res Function(_$TokenDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? jwtToken = freezed,
    Object? userName = freezed,
    Object? registerUser = freezed,
  }) {
    return _then(_$TokenDataModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      jwtToken: freezed == jwtToken
          ? _value.jwtToken
          : jwtToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      registerUser: freezed == registerUser
          ? _value.registerUser
          : registerUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenDataModelImpl implements _TokenDataModel {
  const _$TokenDataModelImpl(
      {this.token, this.jwtToken, this.userName, this.registerUser});

  factory _$TokenDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenDataModelImplFromJson(json);

  @override
  final String? token;
  @override
  final String? jwtToken;
  @override
  final String? userName;
  @override
  final bool? registerUser;

  @override
  String toString() {
    return 'TokenDataModel(token: $token, jwtToken: $jwtToken, userName: $userName, registerUser: $registerUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenDataModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.jwtToken, jwtToken) ||
                other.jwtToken == jwtToken) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.registerUser, registerUser) ||
                other.registerUser == registerUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, jwtToken, userName, registerUser);

  /// Create a copy of TokenDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenDataModelImplCopyWith<_$TokenDataModelImpl> get copyWith =>
      __$$TokenDataModelImplCopyWithImpl<_$TokenDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenDataModelImplToJson(
      this,
    );
  }
}

abstract class _TokenDataModel implements TokenDataModel {
  const factory _TokenDataModel(
      {final String? token,
      final String? jwtToken,
      final String? userName,
      final bool? registerUser}) = _$TokenDataModelImpl;

  factory _TokenDataModel.fromJson(Map<String, dynamic> json) =
      _$TokenDataModelImpl.fromJson;

  @override
  String? get token;
  @override
  String? get jwtToken;
  @override
  String? get userName;
  @override
  bool? get registerUser;

  /// Create a copy of TokenDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenDataModelImplCopyWith<_$TokenDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
