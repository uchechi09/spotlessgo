enum UserRole { cleaner, customer }

class UserModel {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String? profileImage;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] == 'cleaner' ? UserRole.cleaner : UserRole.customer,
      profileImage: json['profileImage'],
    );
  }
}
