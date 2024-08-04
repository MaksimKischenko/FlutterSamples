// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialImpl _$$InitialImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$InitialImpl',
      json,
      ($checkedConvert) {
        final val = _$InitialImpl(
          color: $checkedConvert(
              'color',
              (v) => v == null
                  ? const Color(0xFF2196F3)
                  : const ColorConverter().fromJson(v as Map<String, dynamic>)),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$$InitialImplToJson(_$InitialImpl instance) =>
    <String, dynamic>{
      'color': const ColorConverter().toJson(instance.color),
      'runtimeType': instance.$type,
    };

_$LoadedImpl _$$LoadedImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$LoadedImpl',
      json,
      ($checkedConvert) {
        final val = _$LoadedImpl(
          $checkedConvert(
              'color',
              (v) =>
                  const ColorConverter().fromJson(v as Map<String, dynamic>)),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$$LoadedImplToJson(_$LoadedImpl instance) =>
    <String, dynamic>{
      'color': const ColorConverter().toJson(instance.color),
      'runtimeType': instance.$type,
    };
