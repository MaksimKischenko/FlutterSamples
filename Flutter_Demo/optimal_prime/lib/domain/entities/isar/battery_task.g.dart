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
    r'state': PropertySchema(
      id: 0,
      name: r'state',
      type: IsarType.object,
      target: r'TaskState',
    ),
    r'type': PropertySchema(
      id: 1,
      name: r'type',
      type: IsarType.byte,
      enumMap: _BatteryTasktypeEnumValueMap,
    )
  },
  estimateSize: _batteryTaskEstimateSize,
  serialize: _batteryTaskSerialize,
  deserialize: _batteryTaskDeserialize,
  deserializeProp: _batteryTaskDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'TaskState': TaskStateSchema},
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
    final value = object.state;
    if (value != null) {
      bytesCount += 3 +
          TaskStateSchema.estimateSize(
              value, allOffsets[TaskState]!, allOffsets);
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
  writer.writeObject<TaskState>(
    offsets[0],
    allOffsets,
    TaskStateSchema.serialize,
    object.state,
  );
  writer.writeByte(offsets[1], object.type.index);
}

BatteryTask _batteryTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BatteryTask();
  object.id = id;
  object.state = reader.readObjectOrNull<TaskState>(
    offsets[0],
    TaskStateSchema.deserialize,
    allOffsets,
  );
  object.type =
      _BatteryTasktypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          BatteryTaskType.saveMode;
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
      return (reader.readObjectOrNull<TaskState>(
        offset,
        TaskStateSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (_BatteryTasktypeValueEnumMap[reader.readByteOrNull(offset)] ??
          BatteryTaskType.saveMode) as P;
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
}

extension BatteryTaskQueryObject
    on QueryBuilder<BatteryTask, BatteryTask, QFilterCondition> {
  QueryBuilder<BatteryTask, BatteryTask, QAfterFilterCondition> state(
      FilterQuery<TaskState> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'state');
    });
  }
}

extension BatteryTaskQueryLinks
    on QueryBuilder<BatteryTask, BatteryTask, QFilterCondition> {}

extension BatteryTaskQuerySortBy
    on QueryBuilder<BatteryTask, BatteryTask, QSortBy> {
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
}

extension BatteryTaskQuerySortThenBy
    on QueryBuilder<BatteryTask, BatteryTask, QSortThenBy> {
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
}

extension BatteryTaskQueryWhereDistinct
    on QueryBuilder<BatteryTask, BatteryTask, QDistinct> {
  QueryBuilder<BatteryTask, BatteryTask, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
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

  QueryBuilder<BatteryTask, TaskState?, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<BatteryTask, BatteryTaskType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TaskStateSchema = Schema(
  name: r'TaskState',
  id: 5841462132254291981,
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
  estimateSize: _taskStateEstimateSize,
  serialize: _taskStateSerialize,
  deserialize: _taskStateDeserialize,
  deserializeProp: _taskStateDeserializeProp,
);

int _taskStateEstimateSize(
  TaskState object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _taskStateSerialize(
  TaskState object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.finishDate);
  writer.writeBool(offsets[1], object.isEnabled);
  writer.writeBool(offsets[2], object.isFinished);
  writer.writeDateTime(offsets[3], object.startDate);
}

TaskState _taskStateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskState();
  object.finishDate = reader.readDateTimeOrNull(offsets[0]);
  object.isEnabled = reader.readBoolOrNull(offsets[1]);
  object.isFinished = reader.readBoolOrNull(offsets[2]);
  object.startDate = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _taskStateDeserializeProp<P>(
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

extension TaskStateQueryFilter
    on QueryBuilder<TaskState, TaskState, QFilterCondition> {
  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> finishDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'finishDate',
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition>
      finishDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'finishDate',
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> finishDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finishDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition>
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

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> finishDateLessThan(
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

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> finishDateBetween(
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

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> isEnabledIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isEnabled',
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition>
      isEnabledIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isEnabled',
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> isEnabledEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> isFinishedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFinished',
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition>
      isFinishedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFinished',
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> isFinishedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> startDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition>
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

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> startDateLessThan(
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

  QueryBuilder<TaskState, TaskState, QAfterFilterCondition> startDateBetween(
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

extension TaskStateQueryObject
    on QueryBuilder<TaskState, TaskState, QFilterCondition> {}
