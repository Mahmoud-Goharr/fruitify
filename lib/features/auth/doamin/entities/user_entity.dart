class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String? imageUrl;

  UserEntity({
    required this.name,
    required this.email,
    required this.uId,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uId': uId, 'imageUrl': imageUrl};
  }
}
