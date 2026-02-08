import 'dart:convert';
import 'package:http/http.dart' as http;
import 'database.dart';

class SyncService {
  // ANDROID EMULATOR uses 10.0.2.2, not localhost!
  // If using physical phone, use your PC's IP (e.g., 192.168.1.5)
  static const String _baseUrl = "http://172.31.75.41:8000"; 

  final AppDatabase db;

  SyncService(this.db);

  Future<void> syncPendingAudits() async {
    // 1. Get all audits with status 1 (Pending)
    // (We need to add this query to database.dart first!)
    final pendingAudits = await db.getPendingAudits();

    if (pendingAudits.isEmpty) {
      print("✅ No pending audits to sync.");
      return;
    }

    print("🔄 Found ${pendingAudits.length} audits to sync...");

    for (final audit in pendingAudits) {
      try {
        // 2. Send to Server
        final response = await http.post(
          Uri.parse('$_baseUrl/sync/upload'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "title": audit.title,
            "inspector_id": audit.inspectorId,
            "site_location": audit.siteLocation,
            "created_at": audit.createdAt.toIso8601String(),
          }),
        );

        // 3. If Server says OK (200), update Local DB
        if (response.statusCode == 200) {
          print("✅ Uploaded: ${audit.title}");
          
          // Update syncStatus to 0 (Green)
          await db.markAuditAsSynced(audit.id);
        } else {
          print("❌ Server Error: ${response.statusCode}");
        }
      } catch (e) {
        print("❌ Network Error: $e");
      }
    }
  }
}