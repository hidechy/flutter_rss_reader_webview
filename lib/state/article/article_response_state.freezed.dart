// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleResponseState {
  String get selectFlag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleResponseStateCopyWith<ArticleResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleResponseStateCopyWith<$Res> {
  factory $ArticleResponseStateCopyWith(ArticleResponseState value,
          $Res Function(ArticleResponseState) then) =
      _$ArticleResponseStateCopyWithImpl<$Res, ArticleResponseState>;
  @useResult
  $Res call({String selectFlag});
}

/// @nodoc
class _$ArticleResponseStateCopyWithImpl<$Res,
        $Val extends ArticleResponseState>
    implements $ArticleResponseStateCopyWith<$Res> {
  _$ArticleResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectFlag = null,
  }) {
    return _then(_value.copyWith(
      selectFlag: null == selectFlag
          ? _value.selectFlag
          : selectFlag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleResponseStateImplCopyWith<$Res>
    implements $ArticleResponseStateCopyWith<$Res> {
  factory _$$ArticleResponseStateImplCopyWith(_$ArticleResponseStateImpl value,
          $Res Function(_$ArticleResponseStateImpl) then) =
      __$$ArticleResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String selectFlag});
}

/// @nodoc
class __$$ArticleResponseStateImplCopyWithImpl<$Res>
    extends _$ArticleResponseStateCopyWithImpl<$Res, _$ArticleResponseStateImpl>
    implements _$$ArticleResponseStateImplCopyWith<$Res> {
  __$$ArticleResponseStateImplCopyWithImpl(_$ArticleResponseStateImpl _value,
      $Res Function(_$ArticleResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectFlag = null,
  }) {
    return _then(_$ArticleResponseStateImpl(
      selectFlag: null == selectFlag
          ? _value.selectFlag
          : selectFlag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ArticleResponseStateImpl implements _ArticleResponseState {
  const _$ArticleResponseStateImpl({this.selectFlag = ''});

  @override
  @JsonKey()
  final String selectFlag;

  @override
  String toString() {
    return 'ArticleResponseState(selectFlag: $selectFlag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleResponseStateImpl &&
            (identical(other.selectFlag, selectFlag) ||
                other.selectFlag == selectFlag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectFlag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleResponseStateImplCopyWith<_$ArticleResponseStateImpl>
      get copyWith =>
          __$$ArticleResponseStateImplCopyWithImpl<_$ArticleResponseStateImpl>(
              this, _$identity);
}

abstract class _ArticleResponseState implements ArticleResponseState {
  const factory _ArticleResponseState({final String selectFlag}) =
      _$ArticleResponseStateImpl;

  @override
  String get selectFlag;
  @override
  @JsonKey(ignore: true)
  _$$ArticleResponseStateImplCopyWith<_$ArticleResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
