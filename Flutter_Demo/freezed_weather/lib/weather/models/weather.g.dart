// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemperatureImpl _$$TemperatureImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TemperatureImpl',
      json,
      ($checkedConvert) {
        final val = _$TemperatureImpl(
          value: $checkedConvert('value', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TemperatureImplToJson(_$TemperatureImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$WeatherImpl',
      json,
      ($checkedConvert) {
        final val = _$WeatherImpl(
          condition: $checkedConvert(
              'condition', (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
          lastUpdated: $checkedConvert(
              'lastUpdated', (v) => DateTime.parse(v as String)),
          location: $checkedConvert('location', (v) => v as String),
          temperature: $checkedConvert('temperature',
              (v) => Temperature.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'condition': _$WeatherConditionEnumMap[instance.condition]!,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'location': instance.location,
      'temperature': instance.temperature.toJson(),
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.clear: 'clear',
  WeatherCondition.rainy: 'rainy',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.snowy: 'snowy',
  WeatherCondition.foggy: 'foggy',
  WeatherCondition.unknown: 'unknown',
};
