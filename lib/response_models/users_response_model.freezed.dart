// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FetchUsersResponseModel _$FetchUsersResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FetchUsersResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FetchUsersResponseModel {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<UserDataModel>? get data => throw _privateConstructorUsedError;

  /// Serializes this FetchUsersResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FetchUsersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FetchUsersResponseModelCopyWith<FetchUsersResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchUsersResponseModelCopyWith<$Res> {
  factory $FetchUsersResponseModelCopyWith(FetchUsersResponseModel value,
          $Res Function(FetchUsersResponseModel) then) =
      _$FetchUsersResponseModelCopyWithImpl<$Res, FetchUsersResponseModel>;
  @useResult
  $Res call({int? status, String? message, List<UserDataModel>? data});
}

/// @nodoc
class _$FetchUsersResponseModelCopyWithImpl<$Res,
        $Val extends FetchUsersResponseModel>
    implements $FetchUsersResponseModelCopyWith<$Res> {
  _$FetchUsersResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FetchUsersResponseModel
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
              as List<UserDataModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchUsersResponseModelImplCopyWith<$Res>
    implements $FetchUsersResponseModelCopyWith<$Res> {
  factory _$$FetchUsersResponseModelImplCopyWith(
          _$FetchUsersResponseModelImpl value,
          $Res Function(_$FetchUsersResponseModelImpl) then) =
      __$$FetchUsersResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, String? message, List<UserDataModel>? data});
}

/// @nodoc
class __$$FetchUsersResponseModelImplCopyWithImpl<$Res>
    extends _$FetchUsersResponseModelCopyWithImpl<$Res,
        _$FetchUsersResponseModelImpl>
    implements _$$FetchUsersResponseModelImplCopyWith<$Res> {
  __$$FetchUsersResponseModelImplCopyWithImpl(
      _$FetchUsersResponseModelImpl _value,
      $Res Function(_$FetchUsersResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FetchUsersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FetchUsersResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserDataModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchUsersResponseModelImpl implements _FetchUsersResponseModel {
  const _$FetchUsersResponseModelImpl(
      {this.status, this.message, final List<UserDataModel>? data})
      : _data = data;

  factory _$FetchUsersResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FetchUsersResponseModelImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  final List<UserDataModel>? _data;
  @override
  List<UserDataModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FetchUsersResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUsersResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of FetchUsersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchUsersResponseModelImplCopyWith<_$FetchUsersResponseModelImpl>
      get copyWith => __$$FetchUsersResponseModelImplCopyWithImpl<
          _$FetchUsersResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchUsersResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FetchUsersResponseModel implements FetchUsersResponseModel {
  const factory _FetchUsersResponseModel(
      {final int? status,
      final String? message,
      final List<UserDataModel>? data}) = _$FetchUsersResponseModelImpl;

  factory _FetchUsersResponseModel.fromJson(Map<String, dynamic> json) =
      _$FetchUsersResponseModelImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  List<UserDataModel>? get data;

  /// Create a copy of FetchUsersResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchUsersResponseModelImplCopyWith<_$FetchUsersResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}