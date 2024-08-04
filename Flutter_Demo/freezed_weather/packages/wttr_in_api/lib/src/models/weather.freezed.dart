// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Weather {
  double get humidity => throw _privateConstructorUsedError;
  double get pressure => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  WeatherState get weatherState => throw _privateConstructorUsedError;
  Area get area => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {double humidity,
      double pressure,
      double temperature,
      WeatherState weatherState,
      Area area});

  $AreaCopyWith<$Res> get area;
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? humidity = null,
    Object? pressure = null,
    Object? temperature = null,
    Object? weatherState = null,
    Object? area = null,
  }) {
    return _then(_value.copyWith(
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      weatherState: null == weatherState
          ? _value.weatherState
          : weatherState // ignore: cast_nullable_to_non_nullable
              as WeatherState,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as Area,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AreaCopyWith<$Res> get area {
    return $AreaCopyWith<$Res>(_value.area, (value) {
      return _then(_value.copyWith(area: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double humidity,
      double pressure,
      double temperature,
      WeatherState weatherState,
      Area area});

  @override
  $AreaCopyWith<$Res> get area;
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? humidity = null,
    Object? pressure = null,
    Object? temperature = null,
    Object? weatherState = null,
    Object? area = null,
  }) {
    return _then(_$WeatherImpl(
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      weatherState: null == weatherState
          ? _value.weatherState
          : weatherState // ignore: cast_nullable_to_non_nullable
              as WeatherState,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as Area,
    ));
  }
}

/// @nodoc

class _$WeatherImpl implements _Weather {
  const _$WeatherImpl(
      {required this.humidity,
      required this.pressure,
      required this.temperature,
      required this.weatherState,
      required this.area});

  @override
  final double humidity;
  @override
  final double pressure;
  @override
  final double temperature;
  @override
  final WeatherState weatherState;
  @override
  final Area area;

  @override
  String toString() {
    return 'Weather(humidity: $humidity, pressure: $pressure, temperature: $temperature, weatherState: $weatherState, area: $area)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.weatherState, weatherState) ||
                other.weatherState == weatherState) &&
            (identical(other.area, area) || other.area == area));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, humidity, pressure, temperature, weatherState, area);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final double humidity,
      required final double pressure,
      required final double temperature,
      required final WeatherState weatherState,
      required final Area area}) = _$WeatherImpl;

  @override
  double get humidity;
  @override
  double get pressure;
  @override
  double get temperature;
  @override
  WeatherState get weatherState;
  @override
  Area get area;
  @override
  @JsonKey(ignore: true)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
