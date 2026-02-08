// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AuditsTable extends Audits with TableInfo<$AuditsTable, Audit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _inspectorIdMeta = const VerificationMeta(
    'inspectorId',
  );
  @override
  late final GeneratedColumn<String> inspectorId = GeneratedColumn<String>(
    'inspector_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _siteLocationMeta = const VerificationMeta(
    'siteLocation',
  );
  @override
  late final GeneratedColumn<String> siteLocation = GeneratedColumn<String>(
    'site_location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    inspectorId,
    siteLocation,
    syncStatus,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audits';
  @override
  VerificationContext validateIntegrity(
    Insertable<Audit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('inspector_id')) {
      context.handle(
        _inspectorIdMeta,
        inspectorId.isAcceptableOrUnknown(
          data['inspector_id']!,
          _inspectorIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inspectorIdMeta);
    }
    if (data.containsKey('site_location')) {
      context.handle(
        _siteLocationMeta,
        siteLocation.isAcceptableOrUnknown(
          data['site_location']!,
          _siteLocationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_siteLocationMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Audit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Audit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      inspectorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inspector_id'],
      )!,
      siteLocation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}site_location'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AuditsTable createAlias(String alias) {
    return $AuditsTable(attachedDatabase, alias);
  }
}

class Audit extends DataClass implements Insertable<Audit> {
  final int id;
  final String title;
  final String inspectorId;
  final String siteLocation;
  final int syncStatus;
  final DateTime createdAt;
  const Audit({
    required this.id,
    required this.title,
    required this.inspectorId,
    required this.siteLocation,
    required this.syncStatus,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['inspector_id'] = Variable<String>(inspectorId);
    map['site_location'] = Variable<String>(siteLocation);
    map['sync_status'] = Variable<int>(syncStatus);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AuditsCompanion toCompanion(bool nullToAbsent) {
    return AuditsCompanion(
      id: Value(id),
      title: Value(title),
      inspectorId: Value(inspectorId),
      siteLocation: Value(siteLocation),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
    );
  }

  factory Audit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Audit(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      inspectorId: serializer.fromJson<String>(json['inspectorId']),
      siteLocation: serializer.fromJson<String>(json['siteLocation']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'inspectorId': serializer.toJson<String>(inspectorId),
      'siteLocation': serializer.toJson<String>(siteLocation),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Audit copyWith({
    int? id,
    String? title,
    String? inspectorId,
    String? siteLocation,
    int? syncStatus,
    DateTime? createdAt,
  }) => Audit(
    id: id ?? this.id,
    title: title ?? this.title,
    inspectorId: inspectorId ?? this.inspectorId,
    siteLocation: siteLocation ?? this.siteLocation,
    syncStatus: syncStatus ?? this.syncStatus,
    createdAt: createdAt ?? this.createdAt,
  );
  Audit copyWithCompanion(AuditsCompanion data) {
    return Audit(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      inspectorId: data.inspectorId.present
          ? data.inspectorId.value
          : this.inspectorId,
      siteLocation: data.siteLocation.present
          ? data.siteLocation.value
          : this.siteLocation,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Audit(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('inspectorId: $inspectorId, ')
          ..write('siteLocation: $siteLocation, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, inspectorId, siteLocation, syncStatus, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Audit &&
          other.id == this.id &&
          other.title == this.title &&
          other.inspectorId == this.inspectorId &&
          other.siteLocation == this.siteLocation &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt);
}

class AuditsCompanion extends UpdateCompanion<Audit> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> inspectorId;
  final Value<String> siteLocation;
  final Value<int> syncStatus;
  final Value<DateTime> createdAt;
  const AuditsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.inspectorId = const Value.absent(),
    this.siteLocation = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AuditsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String inspectorId,
    required String siteLocation,
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       inspectorId = Value(inspectorId),
       siteLocation = Value(siteLocation);
  static Insertable<Audit> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? inspectorId,
    Expression<String>? siteLocation,
    Expression<int>? syncStatus,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (inspectorId != null) 'inspector_id': inspectorId,
      if (siteLocation != null) 'site_location': siteLocation,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AuditsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? inspectorId,
    Value<String>? siteLocation,
    Value<int>? syncStatus,
    Value<DateTime>? createdAt,
  }) {
    return AuditsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      inspectorId: inspectorId ?? this.inspectorId,
      siteLocation: siteLocation ?? this.siteLocation,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (inspectorId.present) {
      map['inspector_id'] = Variable<String>(inspectorId.value);
    }
    if (siteLocation.present) {
      map['site_location'] = Variable<String>(siteLocation.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<int>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('inspectorId: $inspectorId, ')
          ..write('siteLocation: $siteLocation, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AuditsTable audits = $AuditsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [audits];
}

typedef $$AuditsTableCreateCompanionBuilder =
    AuditsCompanion Function({
      Value<int> id,
      required String title,
      required String inspectorId,
      required String siteLocation,
      Value<int> syncStatus,
      Value<DateTime> createdAt,
    });
typedef $$AuditsTableUpdateCompanionBuilder =
    AuditsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> inspectorId,
      Value<String> siteLocation,
      Value<int> syncStatus,
      Value<DateTime> createdAt,
    });

class $$AuditsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditsTable> {
  $$AuditsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inspectorId => $composableBuilder(
    column: $table.inspectorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get siteLocation => $composableBuilder(
    column: $table.siteLocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuditsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditsTable> {
  $$AuditsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inspectorId => $composableBuilder(
    column: $table.inspectorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get siteLocation => $composableBuilder(
    column: $table.siteLocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditsTable> {
  $$AuditsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get inspectorId => $composableBuilder(
    column: $table.inspectorId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get siteLocation => $composableBuilder(
    column: $table.siteLocation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AuditsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditsTable,
          Audit,
          $$AuditsTableFilterComposer,
          $$AuditsTableOrderingComposer,
          $$AuditsTableAnnotationComposer,
          $$AuditsTableCreateCompanionBuilder,
          $$AuditsTableUpdateCompanionBuilder,
          (Audit, BaseReferences<_$AppDatabase, $AuditsTable, Audit>),
          Audit,
          PrefetchHooks Function()
        > {
  $$AuditsTableTableManager(_$AppDatabase db, $AuditsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> inspectorId = const Value.absent(),
                Value<String> siteLocation = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuditsCompanion(
                id: id,
                title: title,
                inspectorId: inspectorId,
                siteLocation: siteLocation,
                syncStatus: syncStatus,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String inspectorId,
                required String siteLocation,
                Value<int> syncStatus = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuditsCompanion.insert(
                id: id,
                title: title,
                inspectorId: inspectorId,
                siteLocation: siteLocation,
                syncStatus: syncStatus,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuditsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditsTable,
      Audit,
      $$AuditsTableFilterComposer,
      $$AuditsTableOrderingComposer,
      $$AuditsTableAnnotationComposer,
      $$AuditsTableCreateCompanionBuilder,
      $$AuditsTableUpdateCompanionBuilder,
      (Audit, BaseReferences<_$AppDatabase, $AuditsTable, Audit>),
      Audit,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AuditsTableTableManager get audits =>
      $$AuditsTableTableManager(_db, _db.audits);
}
