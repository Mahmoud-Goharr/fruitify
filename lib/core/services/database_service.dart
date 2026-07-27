abstract class DatabaseService {
  Future<bool> checkIfDataExists({required String path, required String id});

  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });

  Future<Map<String, dynamic>?> getDataById({
    required String path,
    required String id,
    Map<String, dynamic>? query,
  });

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    required String id,
  });

  Future<void> deleteData({required String path, required String id});
}
