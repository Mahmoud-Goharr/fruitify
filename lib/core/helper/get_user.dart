import 'package:fruitify/core/services/shared_preferences_singleton.dart';
import 'package:fruitify/features/auth/doamin/entities/user_entity.dart';

UserEntity? getUser() {
 
  return prehs.getUserData();
}