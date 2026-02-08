import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// 1. Define the Table
class Audits extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get inspectorId => text()();
  TextColumn get siteLocation => text()();
  // 0 = Synced, 1 = Pending
  IntColumn get syncStatus => integer().withDefault(const Constant(1))(); 
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// 2. The Database Class
@DriftDatabase(tables: [Audits])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Create
  Future<int> createAudit(AuditsCompanion entry) {
    return into(audits).insert(entry);
  }

  // Read (Stream)
  Stream<List<Audit>> watchAllAudits() {
    return select(audits).watch();
  }

  // Fetch only the Orange ones
  Future<List<Audit>> getPendingAudits() {
    return (select(audits)..where((t) => t.syncStatus.equals(1))).get();
  }

  // Turn it Green
  Future<void> markAuditAsSynced(int id) {
    return (update(audits)..where((t) => t.id.equals(id))).write(
      const AuditsCompanion(syncStatus: Value(0)),
    );
  }

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}