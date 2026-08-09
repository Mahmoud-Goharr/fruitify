import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruitify/features/auth/doamin/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uId,
    required super.name,
    required super.email,
    super.imageUrl,
  });

  factory UserModel.fromSupabaseUser(User user) {
    return UserModel(
      uId: user.id,
      name: user.userMetadata?['name'] ?? '',
      email: user.email ?? '',
      imageUrl: null,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': uId,
      'name': name,
      'email': email,
    };
  }
}