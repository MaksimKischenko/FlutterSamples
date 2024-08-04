// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? city) started,
    required TResult Function() refreshed,
    required TResult Function() unitsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? city)? started,
    TResult? Function()? refreshed,
    TResult? Function()? unitsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refreshed value) refreshed,
    required TResult Function(_UnitsChanged value) unitsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refreshed value)? refreshed,
    TResult? Function(_UnitsChanged value)? unitsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
          WeatherEvent value, $Res Function(WeatherEvent) then) =
      _$WeatherEventCopyWithImpl<$Res, WeatherEvent>;
}

/// @nodoc
class _$WeatherEventCopyWithImpl<$Res, $Val extends WeatherEvent>
    implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? city});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
  }) {
    return _then(_$StartedImpl(
      freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.city);

  @override
  final String? city;

  @override
  String toString() {
    return 'WeatherEvent.started(city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.city, city) || other.city == city));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? city) started,
    required TResult Function() refreshed,
    required TResult Function() unitsChanged,
  }) {
    return started(city);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? city)? started,
    TResult? Function()? refreshed,
    TResult? Function()? unitsChanged,
  }) {
    return started?.call(city);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(city);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refreshed value) refreshed,
    required TResult Function(_UnitsChanged value) unitsChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refreshed value)? refreshed,
    TResult? Function(_UnitsChanged value)? unitsChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements WeatherEvent {
  const factory _Started(final String? city) = _$StartedImpl;

  String? get city;
  @JsonKey(ignore: true)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshedImplCopyWith<$Res> {
  factory _$$RefreshedImplCopyWith(
          _$RefreshedImpl value, $Res Function(_$RefreshedImpl) then) =
      __$$RefreshedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshedImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$RefreshedImpl>
    implements _$$RefreshedImplCopyWith<$Res> {
  __$$RefreshedImplCopyWithImpl(
      _$RefreshedImpl _value, $Res Function(_$RefreshedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshedImpl implements _Refreshed {
  const _$RefreshedImpl();

  @override
  String toString() {
    return 'WeatherEvent.refreshed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? city) started,
    required TResult Function() refreshed,
    required TResult Function() unitsChanged,
  }) {
    return refreshed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? city)? started,
    TResult? Function()? refreshed,
    TResult? Function()? unitsChanged,
  }) {
    return refreshed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refreshed value) refreshed,
    required TResult Function(_UnitsChanged value) unitsChanged,
  }) {
    return refreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refreshed value)? refreshed,
    TResult? Function(_UnitsChanged value)? unitsChanged,
  }) {
    return refreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed(this);
    }
    return orElse();
  }
}

abstract class _Refreshed implements WeatherEvent {
  const factory _Refreshed() = _$RefreshedImpl;
}

/// @nodoc
abstract class _$$UnitsChangedImplCopyWith<$Res> {
  factory _$$UnitsChangedImplCopyWith(
          _$UnitsChangedImpl value, $Res Function(_$UnitsChangedImpl) then) =
      __$$UnitsChangedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnitsChangedImplCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$UnitsChangedImpl>
    implements _$$UnitsChangedImplCopyWith<$Res> {
  __$$UnitsChangedImplCopyWithImpl(
      _$UnitsChangedImpl _value, $Res Function(_$UnitsChangedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnitsChangedImpl implements _UnitsChanged {
  const _$UnitsChangedImpl();

  @override
  String toString() {
    return 'WeatherEvent.unitsChanged()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnitsChangedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? city) started,
    required TResult Function() refreshed,
    required TResult Function() unitsChanged,
  }) {
    return unitsChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? city)? started,
    TResult? Function()? refreshed,
    TResult? Function()? unitsChanged,
  }) {
    return unitsChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
    required TResult orElse(),
  }) {
    if (unitsChanged != null) {
      return unitsChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refreshed value) refreshed,
    required TResult Function(_UnitsChanged value) unitsChanged,
  }) {
    return unitsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Refreshed value)? refreshed,
    TResult? Function(_UnitsChanged value)? unitsChanged,
  }) {
    return unitsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
    required TResult orElse(),
  }) {
    if (unitsChanged != null) {
      return unitsChanged(this);
    }
    return orElse();
  }
}

abstract class _UnitsChanged implements WeatherEvent {
  const factory _UnitsChanged() = _$UnitsChangedImpl;
}

WeatherState _$WeatherStateFromJson(Map<String, dynamic> json) {
  return _WeatherState.fromJson(json);
}

/// @nodoc
mixin _$WeatherState {
  WeatherStatus get status => throw _privateConstructorUsedError;
  TemperatureUnits get temperatureUnits => throw _privateConstructorUsedError;
  Weather? get weather => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call(
      {WeatherStatus status,
      TemperatureUnits temperatureUnits,
      Weather? weather});

  $WeatherCopyWith<$Res>? get weather;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? temperatureUnits = null,
    Object? weather = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WeatherStatus,
      temperatureUnits: null == temperatureUnits
          ? _value.temperatureUnits
          : temperatureUnits // ignore: cast_nullable_to_non_nullable
              as TemperatureUnits,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res>? get weather {
    if (_value.weather == null) {
      return null;
    }

    return $WeatherCopyWith<$Res>(_value.weather!, (value) {
      return _then(_value.copyWith(weather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
          _$WeatherStateImpl value, $Res Function(_$WeatherStateImpl) then) =
      __$$WeatherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherStatus status,
      TemperatureUnits temperatureUnits,
      Weather? weather});

  @override
  $WeatherCopyWith<$Res>? get weather;
}

/// @nodoc
class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
      _$WeatherStateImpl _value, $Res Function(_$WeatherStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? temperatureUnits = null,
    Object? weather = freezed,
  }) {
    return _then(_$WeatherStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WeatherStatus,
      temperatureUnits: null == temperatureUnits
          ? _value.temperatureUnits
          : temperatureUnits // ignore: cast_nullable_to_non_nullable
              as TemperatureUnits,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherStateImpl implements _WeatherState {
  const _$WeatherStateImpl(
      {this.status = WeatherStatus.initial,
      this.temperatureUnits = TemperatureUnits.celsius,
      this.weather});

  factory _$WeatherStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherStateImplFromJson(json);

  @override
  @JsonKey()
  final WeatherStatus status;
  @override
  @JsonKey()
  final TemperatureUnits temperatureUnits;
  @override
  final Weather? weather;

  @override
  String toString() {
    return 'WeatherState(status: $status, temperatureUnits: $temperatureUnits, weather: $weather)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.temperatureUnits, temperatureUnits) ||
                other.temperatureUnits == temperatureUnits) &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, temperatureUnits, weather);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherStateImplToJson(
      this,
    );
  }
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {final WeatherStatus status,
      final TemperatureUnits temperatureUnits,
      final Weather? weather}) = _$WeatherStateImpl;

  factory _WeatherState.fromJson(Map<String, dynamic> json) =
      _$WeatherStateImpl.fromJson;

  @override
  WeatherStatus get status;
  @override
  TemperatureUnits get temperatureUnits;
  @override
  Weather? get weather;
  @override
  @JsonKey(ignore: true)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
