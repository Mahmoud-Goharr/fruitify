import 'package:fruitify/core/services/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseService implements DatabaseService {
  final SupabaseClient supabase;

  SupabaseDatabaseService(this.supabase);

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await supabase.from(path).insert(data);
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      return await supabase
          .from(path)
          .select()
          .eq('id', documentId)
          .maybeSingle();
    }

    final orderBy = query?['orderBy'] as String?;
    final descending = query?['descending'] as bool? ?? false;
    final limit = query?['limit'] as int?;

    dynamic response;

    if (orderBy != null && limit != null) {
      response = await supabase
          .from(path)
          .select()
          .order(orderBy, ascending: !descending)
          .limit(limit);
    } else if (orderBy != null) {
      response = await supabase
          .from(path)
          .select()
          .order(orderBy, ascending: !descending);
    } else if (limit != null) {
      response = await supabase.from(path).select().limit(limit);
    } else {
      response = await supabase.from(path).select();
    }

    return List<Map<String, dynamic>>.from(response);
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String id,
  }) async {
    final response = await supabase
        .from(path)
        .select('id')
        .eq('id', id)
        .maybeSingle();

    return response != null;
  }

  @override
  Future<Map<String, dynamic>?> getDataById({
    required String path,
    required String id,
    Map<String, dynamic>? query,
  }) async {
    return await supabase.from(path).select().eq('id', id).maybeSingle();
  }

  @override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    required String id,
  }) async {
    await supabase.from(path).update(data).eq('id', id);
  }

  @override
  Future<void> deleteData({required String path, required String id}) async {
    await supabase.from(path).delete().eq('id', id);
  }
}
