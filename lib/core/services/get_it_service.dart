import 'package:fruitify/core/repos/orders_repo/orders_repo.dart';
import 'package:fruitify/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruitify/core/repos/products_repo/products_repo.dart';
import 'package:fruitify/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruitify/core/services/database_service.dart';
import 'package:fruitify/core/services/supabase_auth_service.dart';
import 'package:fruitify/core/services/supabase_database_service.dart';
import 'package:fruitify/features/auth/data/repos/auth_rebo_impl.dart';
import 'package:fruitify/features/auth/doamin/repos/auth_rebo.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<SupabaseAuthService>(
    SupabaseAuthService(Supabase.instance.client.auth),
  );

  getIt.registerSingleton<DatabaseService>(
    SupabaseDatabaseService(Supabase.instance.client),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepositoryImpl(
      supabaseAuthService: getIt<SupabaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(getIt<DatabaseService>()),
  );

  getIt.registerSingleton<OrdersRepo>(OrdersRepoImpl(getIt<DatabaseService>()));
}
