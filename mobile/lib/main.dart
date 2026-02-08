import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import 'database.dart';
import 'sync_service.dart';

void main() {
  runApp(
    Provider<AppDatabase>(
      create: (context) => AppDatabase(),
      child: const MyApp(),
      dispose: (context, db) => db.close(),
    ),
  );
}
//create app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const AuditListScreen());
  }
}

class AuditListScreen extends StatefulWidget {
  const AuditListScreen({super.key});

  @override
  State<AuditListScreen> createState() => _AuditListScreenState();
}

class _AuditListScreenState extends State<AuditListScreen> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Audits'),
        // --- NEW CODE STARTS HERE ---
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () async {
              // 1. Create the service
              final syncService = SyncService(database);
              
              // 2. Run the sync
              await syncService.syncPendingAudits();
              
              // 3. Show a message
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Sync Cycle Completed")),
                );
              }
            },
          )
        ],
        // --- NEW CODE ENDS HERE ---
      ),
      body: StreamBuilder<List<Audit>>(
        stream: database.watchAllAudits(),
        builder: (context, snapshot) {
          final audits = snapshot.data ?? [];
          return ListView.builder(
            itemCount: audits.length,
            itemBuilder: (context, index) {
              final audit = audits[index];
              return ListTile(
                leading: Icon(
                  Icons.circle, 
                  // Orange = Pending, Green = Synced
                  color: audit.syncStatus == 1 ? Colors.orange : Colors.green
                ),
                title: Text(audit.title),
                subtitle: Text(audit.siteLocation),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final newAudit = AuditsCompanion(
            title: drift.Value("Audit #${DateTime.now().second}"),
            inspectorId: const drift.Value("User_1"),
            siteLocation: const drift.Value("Zone A"),
            syncStatus: const drift.Value(1),
          );
          database.createAudit(newAudit);
        },
      ),
    );
  }
}