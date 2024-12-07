// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenRequestModel _$TokenRequestModelFromJson(Map<String, dynamic> json) {
  return _TokenRequestModel.fromJson(json);
}

/// @nodoc
mixin _$TokenRequestModel {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this TokenRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenRequestModelCopyWith<TokenRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenRequestModelCopyWith<$Res> {
  factory $TokenRequestModelCopyWith(
          TokenRequestModel value, $Res Function(TokenRequestModel) then) =
      _$TokenRequestModelCopyWithImpl<$Res, TokenRequestModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$TokenRequestModelCopyWithImpl<$Res, $Val extends TokenRequestModel>
    implements $TokenRequestModelCopyWith<$Res> {
  _$TokenRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenRequestModelImplCopyWith<$Res>
    implements $TokenRequestModelCopyWith<$Res> {
  factory _$$TokenRequestModelImplCopyWith(_$TokenRequestModelImpl value,
          $Res Function(_$TokenRequestModelImpl) then) =
      __$$TokenRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$TokenRequestModelImplCopyWithImpl<$Res>
    extends _$TokenRequestModelCopyWithImpl<$Res, _$TokenRequestModelImpl>
    implements _$$TokenRequestModelImplCopyWith<$Res> {
  __$$TokenRequestModelImplCopyWithImpl(_$TokenRequestModelImpl _value,
      $Res Function(_$TokenRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$TokenRequestModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenRequestModelImpl implements _TokenRequestModel {
  const _$TokenRequestModelImpl({required this.name});

  factory _$TokenRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenRequestModelImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'TokenRequestModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenRequestModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of TokenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenRequestModelImplCopyWith<_$TokenRequestModelImpl> get copyWith =>
      __$$TokenRequestModelImplCopyWithImpl<_$TokenRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenRequestModelImplToJson(
      this,
    );
  }
}

abstract class _TokenRequestModel implements TokenRequestModel {
  const factory _TokenRequestModel({required final String name}) =
      _$TokenRequestModelImpl;

  factory _TokenRequestModel.fromJson(Map<String, dynamic> json) =
      _$TokenRequestModelImpl.fromJson;

  @override
  String get name;

  /// Create a copy of TokenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenRequestModelImplCopyWith<_$TokenRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
