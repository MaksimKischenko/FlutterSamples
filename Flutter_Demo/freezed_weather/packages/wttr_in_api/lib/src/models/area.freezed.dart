// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Area {
  String get name => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  Coordinate get coordinate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AreaCopyWith<Area> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaCopyWith<$Res> {
  factory $AreaCopyWith(Area value, $Res Function(Area) then) =
      _$AreaCopyWithImpl<$Res, Area>;
  @useResult
  $Res call(
      {String name, String country, String region, Coordinate coordinate});

  $CoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$AreaCopyWithImpl<$Res, $Val extends Area>
    implements $AreaCopyWith<$Res> {
  _$AreaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
    Object? region = null,
    Object? coordinate = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      coordinate: null == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as Coordinate,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoordinateCopyWith<$Res> get coordinate {
    return $CoordinateCopyWith<$Res>(_value.coordinate, (value) {
      return _then(_value.copyWith(coordinate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AreaImplCopyWith<$Res> implements $AreaCopyWith<$Res> {
  factory _$$AreaImplCopyWith(
          _$AreaImpl value, $Res Function(_$AreaImpl) then) =
      __$$AreaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String country, String region, Coordinate coordinate});

  @override
  $CoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$$AreaImplCopyWithImpl<$Res>
    extends _$AreaCopyWithImpl<$Res, _$AreaImpl>
    implements _$$AreaImplCopyWith<$Res> {
  __$$AreaImplCopyWithImpl(_$AreaImpl _value, $Res Function(_$AreaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
    Object? region = null,
    Object? coordinate = null,
  }) {
    return _then(_$AreaImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      coordinate: null == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as Coordinate,
    ));
  }
}

/// @nodoc

class _$AreaImpl implements _Area {
  const _$AreaImpl(
      {required this.name,
      required this.country,
      required this.region,
      required this.coordinate});

  @override
  final String name;
  @override
  final String country;
  @override
  final String region;
  @override
  final Coordinate coordinate;

  @override
  String toString() {
    return 'Area(name: $name, country: $country, region: $region, coordinate: $coordinate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, country, region, coordinate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaImplCopyWith<_$AreaImpl> get copyWith =>
      __$$AreaImplCopyWithImpl<_$AreaImpl>(this, _$identity);
}

abstract class _Area implements Area {
  const factory _Area(
      {required final String name,
      required final String country,
      required final String region,
      required final Coordinate coordinate}) = _$AreaImpl;

  @override
  String get name;
  @override
  String get country;
  @override
  String get region;
  @override
  Coordinate get coordinate;
  @override
  @JsonKey(ignore: true)
  _$$AreaImplCopyWith<_$AreaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Coordinate {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoordinateCopyWith<Coordinate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinateCopyWith<$Res> {
  factory $CoordinateCopyWith(
          Coordinate value, $Res Function(Coordinate) then) =
      _$CoordinateCopyWithImpl<$Res, Coordinate>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$CoordinateCopyWithImpl<$Res, $Val extends Coordinate>
    implements $CoordinateCopyWith<$Res> {
  _$CoordinateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordinateImplCopyWith<$Res>
    implements $CoordinateCopyWith<$Res> {
  factory _$$CoordinateImplCopyWith(
          _$CoordinateImpl value, $Res Function(_$CoordinateImpl) then) =
      __$$CoordinateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$CoordinateImplCopyWithImpl<$Res>
    extends _$CoordinateCopyWithImpl<$Res, _$CoordinateImpl>
    implements _$$CoordinateImplCopyWith<$Res> {
  __$$CoordinateImplCopyWithImpl(
      _$CoordinateImpl _value, $Res Function(_$CoordinateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$CoordinateImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CoordinateImpl implements _Coordinate {
  const _$CoordinateImpl({required this.latitude, required this.longitude});

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'Coordinate(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinateImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinateImplCopyWith<_$CoordinateImpl> get copyWith =>
      __$$CoordinateImplCopyWithImpl<_$CoordinateImpl>(this, _$identity);
}

abstract class _Coordinate implements Coordinate {
  const factory _Coordinate(
      {required final double latitude,
      required final double longitude}) = _$CoordinateImpl;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$CoordinateImplCopyWith<_$CoordinateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
