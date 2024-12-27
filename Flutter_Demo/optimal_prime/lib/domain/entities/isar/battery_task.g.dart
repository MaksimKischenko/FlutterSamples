// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBatteryTaskCollection on Isar {
  IsarCollection<BatteryTask> get batteryTasks => this.collection();
}

const BatteryTaskSchema = CollectionSchema(
  name: r'BatteryTask',
  id: 5103073335756137103,
  properties: {
    r'advice': PropertySchema(
      id: 0,
      name: r'advice',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'state': PropertySchema(
      id: 2,
      name: r'state',
      type: IsarType.object,
      target: r'BatteryTaskState',
    ),
    r'type': PropertySchema(
      id: 3,
      name: r'type',
      type: IsarType.byte,
      enumMap: _BatteryTasktypeEnumValueMap,
    ),
    r'urlLink': PropertySchema(
      id: 4,
      name: r'urlLink',
      type: IsarType.string,
    )
  },
  estimateSize: _batteryTaskEstimateSize,
  serialize: _batteryTaskSerialize,
  deserialize: _batteryTaskDeserialize,
  deserializeProp: _batteryTaskDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'BatteryTaskState': BatteryTaskStateSchema},
  getId: _batteryTaskGetId,
  getLinks: _batteryTaskGetLinks,
  attach: _batteryTaskAttach,
  version: '3.1.0+1',
);

int _batteryTaskEstimateSize(
  BatteryTask object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.advice;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.state;
    if (value != null) {
      bytesCount += 3 +
          BatteryTaskStateSchema.estimateSize(
              value, allOffsets[BatteryTaskState]!, allOffsets);
    }
  }
  {
    final value = object.urlLink;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _batteryTaskSerialize(
  BatteryTask object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.advice);
  writer.writeString(offsets[1], object.description);
  writer.writeObject<BatteryTaskState>(
    offsets[2],
    allOffsets,
    BatteryTaskStateSchema.serialize,
    object.state,
  );
  writer.writeByte(offsets[3], object.type.index);
  writer.writeString(offsets[4], object.urlLink);
}

BatteryTask _batteryTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BatteryTask();
  object.advice = reader.readStringOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.state = reader.readObjectOrNull<BatteryTaskState>(
    offsets[2],
    BatteryTaskStateSchema.deserialize,
    allOffsets,
  );
  object.type =
      _BatteryTasktypeValueEnumMap[reader.readByteOrNull(offsets[3])] ??
          BatteryTaskType.saveMode;
  object.urlLink = reader.readStringOrNull(offsets[4]);
  return object;
}

P _batteryTaskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<BatteryTaskState>(
        offset,
        BatteryTaskStateSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (_BatteryTasktypeValueEnumMap[reader.readByteOrNull(offset)] ??
          BatteryTaskType.saveMode) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BatteryTasktypeEnumValueMap = {
  'saveMode': 0,
  'fullCharge': 1,
  'charging': 2,
  'switchOffConnections': 3,
  'lowBattery': 4,
  'hightBattery': 5,
  'darkMode': 6,
  'optimizeScreenWork': 7,
};
const _BatteryTasktypeValueEnumMap = {
  0: BatteryTaskType.saveMode,
  1: BatteryTaskType.fullCharge,
  2: BatteryTaskType.charging,
  3: BatteryTaskType.switchOffConnections,
  4: BatteryTaskType.lowBattery,
  5: BatteryTaskType.hightBattery,
  6: BatteryTaskType.darkMode,
  7: BatteryTaskType.optimizeScreenWork,
};

Id _batteryTaskGetId(BatteryTask object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _batteryTaskGetLinks(BatteryTask object) {
  return [];
}

void _batteryTaskAttach(
    IsarCollection<dynamic> col, Id id, BatteryTask object) {
  object.id = id;
}

extension BatteryTaskQueryWhereSort
    on QueryBuilder<BatteryTask, BatteryTask, QWhere> {
  QueryBuilder<BatteryTask, BatteryTask, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BatteryTaskQueryWhere
    on QueryBuilder<BatteryTask, BatteryTask, QWhereClause> {
  QueryBuilder<BatteryTask, BatteryTask, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BatteryTaskQueryFilter
    on QueryBuilder<BatteryTask, BatteryTask, QFilterCondition> {
  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> adviceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'advice',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      adviceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'advice',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> adviceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      adviceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'advice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> adviceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'advice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> adviceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'advice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      adviceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'advice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> adviceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'advice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> adviceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'advice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> adviceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'advice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      adviceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advice',
        value: '',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      adviceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'advice',
        value: '',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> stateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      stateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> typeEqualTo(
      BatteryTaskType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> typeGreaterThan(
    BatteryTaskType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> typeLessThan(
    BatteryTaskType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> typeBetween(
    BatteryTaskType lower,
    BatteryTaskType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      urlLinkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'urlLink',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      urlLinkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'urlLink',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> urlLinkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urlLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      urlLinkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'urlLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> urlLinkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'urlLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> urlLinkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'urlLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      urlLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'urlLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> urlLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'urlLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> urlLinkContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'urlLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> urlLinkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'urlLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      urlLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urlLink',
        value: '',
      ));
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition>
      urlLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'urlLink',
        value: '',
      ));
    });
  }
}

extension BatteryTaskQueryObject
    on QueryBuilder<BatteryTask, BatteryTask, QFilterCondition> {
  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> state(
      FilterQuery<BatteryTaskState> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'state');
    });
  }
}

extension BatteryTaskQueryLinks
    on QueryBuilder<BatteryTask, BatteryTask, QFilterCondition> {}

extension BatteryTaskQuerySortBy
    on QueryBuilder<BatteryTask, BatteryTask, QSortBy> {
  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> sortByAdvice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advice', Sort.asc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> sortByAdviceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advice', Sort.desc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> sortByUrlLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlLink', Sort.asc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> sortByUrlLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlLink', Sort.desc);
    });
  }
}

extension BatteryTaskQuerySortThenBy
    on QueryBuilder<BatteryTask, BatteryTask, QSortThenBy> {
  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> thenByAdvice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advice', Sort.asc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> thenByAdviceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advice', Sort.desc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> thenByUrlLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlLink', Sort.asc);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QAfterSortBy> thenByUrlLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlLink', Sort.desc);
    });
  }
}

extension BatteryTaskQueryWhereDistinct
    on QueryBuilder<BatteryTask, BatteryTask, QDistinct> {
  QueryBuilder<BatteryTask, BatteryTask, QDistinct> distinctByAdvice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'advice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<BatteryTask, BatteryTask, QDistinct> distinctByUrlLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'urlLink', caseSensitive: caseSensitive);
    });
  }
}

extension BatteryTaskQueryProperty
    on QueryBuilder<BatteryTask, BatteryTask, QQueryProperty> {
  QueryBuilder<BatteryTask, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BatteryTask, String?, QQueryOperations> adviceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'advice');
    });
  }

  QueryBuilder<BatteryTask, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<BatteryTask, BatteryTaskState?, QQueryOperations>
      stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<BatteryTask, BatteryTaskType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<BatteryTask, String?, QQueryOperations> urlLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'urlLink');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BatteryTaskStateSchema = Schema(
  name: r'BatteryTaskState',
  id: -5926871044345967669,
  properties: {
    r'finishDate': PropertySchema(
      id: 0,
      name: r'finishDate',
      type: IsarType.dateTime,
    ),
    r'isEnabled': PropertySchema(
      id: 1,
      name: r'isEnabled',
      type: IsarType.bool,
    ),
    r'isFinished': PropertySchema(
      id: 2,
      name: r'isFinished',
      type: IsarType.bool,
    ),
    r'startDate': PropertySchema(
      id: 3,
      name: r'startDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _batteryTaskStateEstimateSize,
  serialize: _batteryTaskStateSerialize,
  deserialize: _batteryTaskStateDeserialize,
  deserializeProp: _batteryTaskStateDeserializeProp,
);

int _batteryTaskStateEstimateSize(
  BatteryTaskState object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _batteryTaskStateSerialize(
  BatteryTaskState object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.finishDate);
  writer.writeBool(offsets[1], object.isEnabled);
  writer.writeBool(offsets[2], object.isFinished);
  writer.writeDateTime(offsets[3], object.startDate);
}

BatteryTaskState _batteryTaskStateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BatteryTaskState();
  object.finishDate = reader.readDateTimeOrNull(offsets[0]);
  object.isEnabled = reader.readBoolOrNull(offsets[1]);
  object.isFinished = reader.readBoolOrNull(offsets[2]);
  object.startDate = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _batteryTaskStateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BatteryTaskStateQueryFilter
    on QueryBuilder<BatteryTaskState, BatteryTaskState, QFilterCondition> {
  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      finishDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finishDate',
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      finishDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finishDate',
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      finishDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      finishDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      finishDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      finishDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finishDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      isEnabledIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isEnabled',
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      isEnabledIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isEnabled',
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      isEnabledEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      isFinishedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFinished',
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      isFinishedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFinished',
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      isFinishedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      startDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BatteryTaskState, BatteryTaskState, QAfterFilterCondition>
      startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BatteryTaskStateQueryObject
    on QueryBuilder<BatteryTaskState, BatteryTaskState, QFilterCondition> {}
